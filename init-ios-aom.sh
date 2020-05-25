#! /usr/bin/env bash
#
# Copyright (C) 2013-2015 Bilibili
# Copyright (C) 2013-2015 Zhang Rui <bbcallen@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

IJK_AOM_UPSTREAM=https://aomedia.googlesource.com/aom
IJK_AOM_FORK=https://aomedia.googlesource.com/aom
IJK_AOM_COMMIT=a5e3f02b18668957bbd054a1058cb190f298ca6f
IJK_AOM_LOCAL_REPO=extra/aom

set -e
TOOLS=tools

echo "== pull aom base =="
sh $TOOLS/pull-repo-base.sh $IJK_AOM_UPSTREAM $IJK_AOM_LOCAL_REPO

function pull_fork()
{
    echo "== pull aom fork $1 =="
    sh $TOOLS/pull-repo-ref.sh $IJK_AOM_FORK ios/aom-$1 ${IJK_AOM_LOCAL_REPO}
    cd ios/aom-$1
    git checkout ${IJK_AOM_COMMIT} -B ijkplayer
    cd -
}

pull_fork "armv7s"
pull_fork "arm64"
pull_fork "i386"
pull_fork "x86_64"
