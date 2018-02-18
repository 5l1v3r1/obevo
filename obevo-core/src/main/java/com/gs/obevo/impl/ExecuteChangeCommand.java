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
package com.gs.obevo.impl;

import com.gs.obevo.api.appdata.ChangeKey;
import com.gs.obevo.api.platform.CommandExecutionContext;
import org.eclipse.collections.api.set.ImmutableSet;

/**
 * A command that will actually invoke some action against the environment that would affect your applications.
 */
public interface ExecuteChangeCommand extends AuditChangeCommand {
    void execute(ChangeTypeBehaviorRegistry changeTypeBehaviorRegistry, CommandExecutionContext cec);

    boolean isDrop();

    ExecuteChangeCommand withDrop(boolean drop);

    /**
     * List of dependencies that this change relies on. Ideally would be available via {@link #getChanges()}.
     * TODO refactor this into Change or something else, per GITHUB#158
     */
    ImmutableSet<ChangeKey> getDependencyChangeKeys();

    void setDependencyChangeKeys(ImmutableSet<ChangeKey> dependencyChangeKeys);
}
