package karate.request;

import com.intuit.karate.junit5.Karate;

public class UpdatePet {

    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:karate/request/updatePet.feature").relativeTo(getClass());
    }
}