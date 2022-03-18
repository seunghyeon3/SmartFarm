package co.smartFarm.prj;

import java.util.List;

import lombok.Data;

@Data
public class EthResultVO {

    private String jsonrpc;
    private String id;
    private List<Object> result;

}
