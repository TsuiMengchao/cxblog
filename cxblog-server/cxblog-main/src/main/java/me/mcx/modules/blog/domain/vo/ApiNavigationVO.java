package me.mcx.modules.blog.domain.vo;

import me.mcx.modules.blog.domain.Navigation;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ApiNavigationVO {

    private String siteClassName;

    private List<Navigation> navigations;
}
