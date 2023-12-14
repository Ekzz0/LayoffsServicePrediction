package ru.isotropicTensor.utils;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;

public class StringToDoubleDeserializer extends JsonDeserializer<Double> {

    @Override
    public Double deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        String value = jsonParser.getValueAsString();
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Unable to deserialize value: " + value, e);
        }
    }
}
