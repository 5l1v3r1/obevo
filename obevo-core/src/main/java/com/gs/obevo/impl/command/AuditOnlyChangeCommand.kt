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
package com.gs.obevo.impl.command

import com.gs.obevo.api.appdata.Change
import com.gs.obevo.api.appdata.GroupChange
import com.gs.obevo.impl.AuditChangeCommand

abstract class AuditOnlyChangeCommand internal constructor(protected val artifact: Change) : AuditChangeCommand {
    override val commandDescription: String
        get() = this.artifact.displayString

    override val changes: List<Change>
        get() = if (this.artifact is GroupChange) {
            artifact.changes.castToList()
        } else {
            listOf(this.artifact)
        }

    override val schema: String
        get() = changes.first().schema
}
