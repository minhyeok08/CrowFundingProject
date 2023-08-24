package com.sist.task;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduledTask {
    private final JdbcTemplate jdbcTemplate;

    public ScheduledTask(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행
    public void updateFundmaking() {
        String sql = "UPDATE fundmaking SET acno = CASE WHEN openday <= SYSDATE THEN 1 ELSE 3 END";
        jdbcTemplate.update(sql);
        System.out.println("Fundmaking table updated."); // 선택사항: 작업 실행을 확인하기 위한 로그
    }
}