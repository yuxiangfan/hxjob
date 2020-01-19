package com.hx.hxjob.system;


import com.hx.hxjob.dao.OrganizationMapper;
import com.hx.hxjob.dao.PositionMapper;
import com.hx.hxjob.util.SpringUtils;
import org.springframework.util.StringUtils;

public class CodeGenerator {

    public static final String ORG_PRE = "O";

    public static final String POS_PRE = "P";

    public static final String EXAM_PRE = "E";

    private static CodeGenerator codeGenerator = null;

    PositionMapper positionMapper = (PositionMapper) SpringUtils.getBean("positionMapper");

    OrganizationMapper organizationMapper = (OrganizationMapper) SpringUtils.getBean("organizationMapper");

    CalendarMapper calendarMapper =  (CalendarMapper) SpringUtils.getBean("calendarMapper");

    public static synchronized CodeGenerator getInstance() {
        if (codeGenerator == null) {
            return new CodeGenerator();
        } else {
            return CodeGenerator.codeGenerator;
        }
    }

    public CodeGenerator() {

    }

    /*创建考试代码*/
    public synchronized String generateExamCode() {

        String lastCode = this.calendarMapper.getLastExamCode();

        if (StringUtils.isEmpty(lastCode)) {
            return CodeGenerator.EXAM_PRE + "0001";
        }

        int index = Integer.valueOf(lastCode.substring(1));

        index++;

        String indexStr = "";

        if (index < 10) {
            indexStr = "000" + index;
        } else if (index >= 10 && index < 100) {
            indexStr = "00" + index;
        } else if (index >= 100 && index < 1000) {
            indexStr = "0" + index;
        } else if (index >= 1000 && index < 10000) {
            indexStr = "" + index;
        }

        return CodeGenerator.EXAM_PRE + indexStr;
    }


    /**
     * 创建机构代码
     *
     * @return
     */
    public synchronized String generateOrgCode() {

        String lastCode = this.organizationMapper.getLastOrgCode();

        if (StringUtils.isEmpty(lastCode)) {
            return CodeGenerator.ORG_PRE + "0001";
        }

        int index = Integer.valueOf(lastCode.substring(1));

        index++;

        String indexStr = "";

        if (index < 10) {
            indexStr = "000" + index;
        } else if (index >= 10 && index < 100) {
            indexStr = "00" + index;
        } else if (index >= 100 && index < 1000) {
            indexStr = "0" + index;
        } else if (index >= 1000 && index < 10000) {
            indexStr = "" + index;
        }

        return CodeGenerator.ORG_PRE + indexStr;
    }

    /**
     * 创建职位代码
     *
     * @return
     */
    public synchronized String generatePosCode() {

        String lastCode = this.positionMapper.getLastPosCode();

        if (StringUtils.isEmpty(lastCode)) {
            return CodeGenerator.POS_PRE + "0001";
        }

        int index = Integer.valueOf(lastCode.substring(1));

        index++;

        String indexStr = "";

        if (index < 10) {
            indexStr = "000" + index;
        } else if (index >= 10 && index < 100) {
            indexStr = "00" + index;
        } else if (index >= 100 && index < 1000) {
            indexStr = "0" + index;
        } else if (index >= 1000 && index < 10000) {
            indexStr = "" + index;
        }

        return CodeGenerator.POS_PRE + indexStr;
    }


}
