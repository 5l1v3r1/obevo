/**
 * Copyright 2017 Goldman Sachs.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.gs.obevocomparer.input.aggregate.field;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.gs.obevocomparer.data.CatoDataObject;
import com.gs.obevocomparer.util.TestUtil;
import org.junit.Assert;
import org.junit.Test;

public class MinFieldTest {

    private MinField field;

    @Test
    public void testConstructor() {
        this.field = new MinField("My Name", "Base Data");
        Assert.assertEquals("My Name", this.field.getName());
        Assert.assertEquals("Base Data", this.field.getBaseField());

        this.field = new MinField("My Name");
        Assert.assertEquals("My Name", this.field.getName());
        Assert.assertEquals("My Name", this.field.getBaseField());
    }

    @Test
    public void testGetValue() {
        List<CatoDataObject> objs = new ArrayList<CatoDataObject>();
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", 3.5, "Val 2", 13));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", -4, "Val 2", 14));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", (short) 5, "Val 2", 15));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", new BigDecimal("2.3"), "Val 2", 16));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", null, "Val 2", null));

        this.field = new MinField("Val 1");

        Assert.assertEquals(-4.0, (double) this.field.getValue(objs), 0.01);
    }

    @Test
    public void testGetValueWithInvalidTypes() {

        List<CatoDataObject> objs = new ArrayList<CatoDataObject>();
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", 5.5, "Val 2", 15));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", "abc", "Val 2", 13));
        objs.add(TestUtil.createDataObjectWithKeys("Val 1", null, "Val 2", null));

        this.field = new MinField("Val 1");
        TestUtil.clearLogged();

        org.junit.Assert.assertEquals(5.5, (double) this.field.getValue(objs), 0.01);
    }
}