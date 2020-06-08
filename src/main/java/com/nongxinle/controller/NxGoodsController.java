package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityGoodsEntity;
import com.nongxinle.entity.NxStandardEntity;
import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.service.NxStandardService;
import com.nongxinle.utils.UploadFile;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.nongxinle.utils.PinYin4jUtils.getHeadStringByString;
import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxgoods")
public class NxGoodsController {
    @Autowired
    private NxGoodsService nxGoodsService;

    @Autowired
    private NxCommunityGoodsService dgService;

    @Autowired
    private NxStandardService standardService;



    @RequestMapping(value = "/adminGetGoodsTree")
    @ResponseBody
    public R adminGetGoodsTree( ) {
           List<NxGoodsEntity> entities =  nxGoodsService.queryGoodsTree();

        return R.ok().put("data", entities);
    }
    @RequestMapping(value = "/adminGetTypeGoodsCata/{type}")
    @ResponseBody
    public R adminGetTypeGoodsCata(@PathVariable Integer type) {
        System.out.println(type);
       List<NxGoodsEntity> goodsEntities =  nxGoodsService.queryGoodsCataByType(type);


        return R.ok().put("data", goodsEntities);
    }





    @RequestMapping(value = "/getGoodsSubNamesByFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R getGoodsSubNamesByFatherid(Integer limit, Integer page, Integer fatherId) {


        List<NxGoodsEntity> nxGoodsEntities1 = queryByFatherIdwithLimit(limit, page, fatherId);
        List<NxGoodsEntity> newList = new ArrayList<>();

        for (NxGoodsEntity fatherGoods:nxGoodsEntities1) {
            StringBuilder builder = new StringBuilder();
            List<NxGoodsEntity> goodsEntities =   nxGoodsService.querySubNameByFatherId(fatherGoods.getNxGoodsId());
         for (NxGoodsEntity goods : goodsEntities) {
             String nxGoodsName = goods.getNxGoodsName();
             builder.append(nxGoodsName);
             builder.append(',');
            }

            fatherGoods.setNxGoodsSubNames(builder.toString());
            newList.add(fatherGoods);
        }


        int total = nxGoodsService.queryTotalByFatherId(fatherId);
        PageUtils pageUtil = new PageUtils(newList, total, limit, page);

        return R.ok().put("page",pageUtil);
    }


      private List<NxGoodsEntity>  queryByFatherIdwithLimit(Integer limit, Integer page, Integer fatherId){
          Map<String, Object> map = new HashMap<>();
          map.put("offset", (page - 1) * limit);
          map.put("limit", limit);
          map.put("fatherId", fatherId);

          //查询列表数据
          List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryListWithFatherId(map);

          return nxGoodsEntities;
       }


        @RequestMapping(value = "/getAddCommunityGoods", method = RequestMethod.POST)
         @ResponseBody
         public R getAddCommunityGoods (Integer limit, Integer page, Integer fatherId, Integer communityId ) {
            System.out.println("hen");
            List<NxGoodsEntity> nxGoodsEntities1 = queryByFatherIdwithLimit(limit, page, fatherId);

            List<NxGoodsEntity> goodsEntities = new ArrayList<>();

            for (NxGoodsEntity goods : nxGoodsEntities1) {
                Map<String, Object> map = new HashMap<>();
                map.put("communityId", communityId);
                map.put("goodsId", goods.getNxGoodsId());
                List<NxCommunityGoodsEntity> dgGoods = dgService.queryCommunityDownloadGoods(map);
                Integer nxGoodsId = goods.getNxGoodsId();
                List<NxStandardEntity> standardEntities =  standardService.queryGoodsStandardListByGoodId(nxGoodsId);
                goods.setNxGoodsStandardEntities(standardEntities);

                if(dgGoods.size() > 0) {
                    goods.setIsDownload(1);
                    goodsEntities.add(goods);
                }else {
                    goods.setIsDownload(0);
                    goodsEntities.add(goods);
                }
            }

            int total = nxGoodsService.queryTotalByFatherId(fatherId);
            PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
           return R.ok().put("page", pageUtil);
         }


    /**
     * ok
     * sign获取电子牌商品
     * @param limit 最大
     * @param page 第几页
     * @param fatherId 上级id
     * @return 商品
     */
    @RequestMapping(value = "/getIbookGoodsByFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R getGoodsByFatherId(Integer limit, Integer page, Integer fatherId, Integer disId) {

        List<NxGoodsEntity> nxGoodsEntities1 = queryByFatherIdwithLimit(limit, page, fatherId);

        List<NxGoodsEntity> goodsEntities = new ArrayList<>();

        for (NxGoodsEntity goods : nxGoodsEntities1) {
            Map<String, Object> map = new HashMap<>();
            map.put("disId", disId);
            map.put("goodsId", goods.getNxGoodsId());
           List<NxCommunityGoodsEntity> dgGoods = dgService.queryDisDownloadGoods(map);
            Integer nxGoodsId = goods.getNxGoodsId();
            List<NxStandardEntity> standardEntities =  standardService.queryGoodsStandardListByGoodId(nxGoodsId);
            goods.setNxGoodsStandardEntities(standardEntities);

            if(dgGoods.size() > 0) {
               goods.setIsDownload(1);
               goodsEntities.add(goods);
           }else {
               goods.setIsDownload(0);
               goodsEntities.add(goods);
           }
        }

        int total = nxGoodsService.queryTotalByFatherId(fatherId);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);

        return R.ok().put("page", pageUtil);

    }


    /**
     * ok
     * 获取ibook书皮数据
     * @return 封皮数据
     */
    @RequestMapping(value = "/getiBookCover")
    @ResponseBody
    public R getiBookCover() {

        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.getiBookCoverData();

        for (NxGoodsEntity goods : nxGoodsEntities) {
            if (goods.getNxGoodsId().equals(1)) {
                goods.setColor("#20afb8");
            }
            if (goods.getNxGoodsId().equals(2)) {
                goods.setColor("#f5c832");
            }
            if (goods.getNxGoodsId().equals(3)) {
                goods.setColor("#3cc36e");
            }
            if (goods.getNxGoodsId().equals(4)) {
                goods.setColor("#1ebaee");
            }
            if (goods.getNxGoodsId().equals(5)) {
                goods.setColor("#f09628");
            }
            if (goods.getNxGoodsId().equals(6)) {
                goods.setColor("#f05a32");
            }
            if (goods.getNxGoodsId().equals(7)) {
                goods.setColor("#20afb8");
            }
            if (goods.getNxGoodsId().equals(8)) {
                goods.setColor("#969696");
            }
        }

        return R.ok().put("data", nxGoodsEntities);
    }





    /**
     * todo testPage
     * @param fatherId
     * @return
     */
    @RequestMapping(value = "/getiBookFatherGoodsAndInitPage/{fatherId}")
    @ResponseBody
    public R nxGoodsCateList(@PathVariable Integer fatherId) {
        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.getAllFatherGoods(fatherId);

        NxGoodsEntity nxGoodsEntity = nxGoodsEntities.get(0);
        Integer nxGoodsId = nxGoodsEntity.getNxGoodsId();
        List<NxGoodsEntity> nxGoodsEntities1 = queryList(nxGoodsId);
        Map<String, Object> map = new HashMap<>();
        map.put("fatherList", nxGoodsEntities);
        map.put("initGoods", nxGoodsEntities1);

        return R.ok().put("data", map);
    }


    public List<NxGoodsEntity> queryList(Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", 0);
        map.put("limit", 20);
        map.put("fatherId", fatherId);

        //查询列表数据
        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryListWithFatherId(map);
        return nxGoodsEntities;

    }


    /**
     * todo testData
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getCatalogue", method = RequestMethod.POST)
    public R getCatalogue(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        List<NxGoodsEntity> nxGoodsEntities1 = nxGoodsService.queryList(map);
        for (NxGoodsEntity goods : nxGoodsEntities1) {
            List<NxGoodsEntity> nxGoodsEntityList = goods.getNxGoodsEntityList();
            for (NxGoodsEntity goods2: nxGoodsEntityList) {
                String nxGoodsFile = goods2.getNxGoodsFile();
                System.out.println(nxGoodsFile + "------");
            }
        }


        return R.ok().put("data", nxGoodsEntities1);

    }
    /**
     * 导出excel
     *
     * @param response
     */
    @RequestMapping("/downloadExcel")
    @ResponseBody
    public void downloadExcel(HttpServletResponse response, HttpServletRequest request) {

        System.out.println("haihaiahai");

        String fatherId = request.getParameter("fatherId");



        try {
            List<NxGoodsEntity> ckGoodsEntities = nxGoodsService.downloadGoods(fatherId);
            HSSFWorkbook wb = new HSSFWorkbook();
            HSSFSheet sheet = wb.createSheet("产品");

            //设置表头
            HSSFRow row = sheet.createRow(0);

            row.createCell(0).setCellValue("商品id");
            row.createCell(1).setCellValue("商品名称");
            row.createCell(2).setCellValue("父级id");
            row.createCell(3).setCellValue("规格");
            row.createCell(12).setCellValue("商品排序");

            //设置表体
            HSSFRow goodsRow = null;
            for (int i = 0; i < ckGoodsEntities.size(); i++) {
                NxGoodsEntity ckGoodsEntity = ckGoodsEntities.get(i);
                goodsRow = sheet.createRow(i + 1);
                goodsRow.createCell(0).setCellValue(ckGoodsEntity.getNxGoodsId());
                goodsRow.createCell(1).setCellValue(ckGoodsEntity.getNxGoodsName());
                goodsRow.createCell(2).setCellValue(ckGoodsEntity.getNxGoodsFatherId());
                goodsRow.createCell(3).setCellValue(ckGoodsEntity.getNxGoodsStandardname());
                goodsRow.createCell(4).setCellValue(ckGoodsEntity.getNxGoodsSort());

            }


            String fileName = new String("导出商品.xls".getBytes("utf-8"), "iso8859-1");
            response.setHeader("content-Disposition", "attachment; filename =" + fileName);
            wb.write(response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 下载导入商品的Excel模版
     *
     * @param response no
     * @param session  获取保存文件路径
     */
    @RequestMapping(value = "/downloadExcelTMP", method = RequestMethod.GET)
    @ResponseBody
    public void downloadExcelTMP(HttpServletResponse response, HttpSession session) {

        FileInputStream is = null;

        try {
            String fileName = new String("商品模版.xls".getBytes("utf-8"), "iso8859-1");
            response.setHeader("content-Disposition", "attachment; filename =" + fileName);

            ServletContext servletContext = session.getServletContext();
            String realPath = servletContext.getRealPath("statics/goodsTML.xls");

            is = new FileInputStream(realPath);

            IOUtils.copy(is, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * ok
     * 导入商品
     *
     * @param file    xls文件
     * @param session http
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadExcel", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public R uploadExcel(@RequestParam("file") MultipartFile file,
                         HttpSession session) throws Exception {
        System.out.println(file.getName());
        HSSFWorkbook wb = new HSSFWorkbook(file.getInputStream());

        HSSFSheet sheet = null;
        for (int j = 0; j < wb.getNumberOfSheets(); j++) {
            sheet = wb.getSheetAt(j);

            int lastRowNum = sheet.getLastRowNum();

            System.out.println(lastRowNum);

            Row goodsRow = null;

            for (int i = 1; i <= lastRowNum; i++) {

                goodsRow = sheet.getRow(i);
                NxGoodsEntity goods = new NxGoodsEntity();


                String goodsName = (String) getCellValue(goodsRow.getCell(1));

                String pinyin = hanziToPinyin(goodsName);

                String headPinyin = getHeadStringByString(goodsName, false, null);
                goods.setNxGoodsPinyin(pinyin);
                goods.setNxGoodsPy(headPinyin);

                goods.setNxGoodsSort((Integer) getCellValue(goodsRow.getCell(0)));
                goods.setNxGoodsName((String) getCellValue(goodsRow.getCell(1)));
                goods.setNxGoodsFatherId((Integer) getCellValue(goodsRow.getCell(2)));
                goods.setNxGoodsStandardname((String) getCellValue(goodsRow.getCell(3)));
                goods.setNxGoodsPlace((String) getCellValue(goodsRow.getCell(4)));
                goods.setNxGoodsBrand((String) getCellValue(goodsRow.getCell(5)));

                nxGoodsService.save(goods);
            }
        }

        return R.ok();

    }



    private Object getCellValue(Cell cell) {

        switch (cell.getCellType()) {
            case STRING:
                return cell.getRichStringCellValue().getString();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue();
                } else {
                    double numericCellValue = cell.getNumericCellValue();

                    String s = String.valueOf(numericCellValue);
                    int i1 = Integer.parseInt(s.replace(".0", ""));
                    System.out.println("aaaaahahahahhahhahahha");
                    return i1;
                }
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case FORMULA:
                return cell.getCellFormula();
        }

        return cell;

    }


    /**
     * wait
     * ============
     */

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping(value = "/info/{nxGoodsId}")
//    @RequiresPermissions("nxgoods:info")
    public R info(@PathVariable Integer nxGoodsId) {
        System.out.println("akfja;lkfjas");
        NxGoodsEntity nxGoods = nxGoodsService.queryObject(nxGoodsId);

        return R.ok().put("data", nxGoods);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping(value = "/save", produces = "text/html;charset=UTF-8")
//    @RequiresPermissions("nxgoods:save")
    public R save(@RequestParam("file") MultipartFile file, @RequestParam("nxGoodsName") String goodsName,
                  @RequestParam("nxGoodsStandardName") String nxGoodsStandardName,
                  @RequestParam("nxGoodsId") Integer nxGoodsId,  @RequestParam("nxGoodsFatherId") Integer nxGoodsFatherId,
                  HttpSession session) {
        System.out.println("hahhah");
        System.out.println(file);
        System.out.println(goodsName);
        System.out.println(nxGoodsStandardName);

        System.out.println(nxGoodsId);

        //1,上传图片
        String newUploadName = "uploadImage";
        String realPath = UploadFile.upload(session, newUploadName, file);

        String filename = file.getOriginalFilename();
        String filePath = newUploadName + "/" + filename;

        System.out.println(filePath);
        System.out.println("filebpathth");

        if(nxGoodsId.equals(-1)){
            NxGoodsEntity goodsEntity = new NxGoodsEntity();
            goodsEntity.setNxGoodsFile(filePath);
            goodsEntity.setNxGoodsName(goodsName);
            goodsEntity.setNxGoodsStandardname(nxGoodsStandardName);
            goodsEntity.setNxGoodsFatherId(nxGoodsFatherId);
            nxGoodsService.save(goodsEntity);

        }else {

        }



        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxgoods:update")
    public R update(@RequestBody NxGoodsEntity nxGoods) {
        nxGoodsService.update(nxGoods);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxgoods:delete")
    public R delete(@RequestBody Integer[] nxGoodsIds) {
        nxGoodsService.deleteBatch(nxGoodsIds);

        return R.ok();
    }

}
