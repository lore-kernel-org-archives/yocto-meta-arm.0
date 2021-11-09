Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B2BC4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:44:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13074.1636469087123407847
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 06:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9023F2B
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14A013F800
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] gem5/gem5-aarch64-native: fix fuzz in patch
Date: Tue,  9 Nov 2021 14:44:41 +0000
Message-Id: <20211109144441.24512-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109144441.24512-1-ross.burton@arm.com>
References: <20211109144441.24512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 14:44:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2350

Not sure how this wasn't caught by the CI, human error no doubt.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/files/mapping.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/files/mapping.patch b/meta-g=
em5/recipes-devtools/gem5/files/mapping.patch
index 5eb34d82..3a7cb437 100644
--- a/meta-gem5/recipes-devtools/gem5/files/mapping.patch
+++ b/meta-gem5/recipes-devtools/gem5/files/mapping.patch
@@ -23,13 +23,13 @@ diff --git a/src/python/m5/debug.py b/src/python/m5/d=
ebug.py
 index d808850cc..787a39ece 100644
 --- a/src/python/m5/debug.py
 +++ b/src/python/m5/debug.py
-@@ -24,7 +24,7 @@
- # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-=20
+@@ -26,7 +26,7 @@
+
+ from __future__ import print_function
+
 -from collections import Mapping
 +from collections.abc import Mapping
-=20
+
  import _m5.debug
  from _m5.debug import SimpleFlag, CompoundFlag
 --=20
--=20
2.25.1


