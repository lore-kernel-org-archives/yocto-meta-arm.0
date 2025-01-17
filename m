Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F3EC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:37:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.7844.1737110246531194333
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P76BkAnt;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so15129131fa.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jan 2025 02:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737110244; x=1737715044; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv03v8GxV6Sm7UE9DGbSQqWVexxcInsQC6Q1IRIl6So=;
        b=P76BkAntXLZp0+ifVGlx+C0vssWMueAW8DpcsRHuShVbU3pNCBd/DiW6rOUaapKpJB
         FYu14ifnTFQpM2yY/OVwX4FUIM02ZRCXpYs7RifbYLWtdOo1pOEoKnCzor4OoV8mNkzp
         4z7P0J2BjckTzGSnHjAmq51lsGlgKYPJQetXYHlSdtF+UniTsy8lfveIJs6z2ZzE6awh
         bKCYsjz0O6qhRpVf/XpO5RzyEM+lRykE0+E55QOXaZuXCye2RDR3/0Si7B8kE9ffm/bg
         3M95rdASRDSR9+JU4iBMx24t9yGAtATk+15JXWSlTF9mHbjNlNRPcUcwJbn5AwsepO25
         r7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110244; x=1737715044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv03v8GxV6Sm7UE9DGbSQqWVexxcInsQC6Q1IRIl6So=;
        b=EIPPbvxDP6XAQbAEAnlmFDgrm8GAFcNsKDVT5AhQ2K0CE5VZ20duujzpHhXUYSIu3X
         F2CceJM3wQSQ+Ez1N8IpNlN4kcn3cRDhIyKx+qon86vROs2genQrueNXMO7q5pLl0L11
         FbHF19GsYLG1TobjIUz0ZC0F3FNhwguXNfWcrT060qxaKP7ROTjzESzttzbsoh1lxIL7
         dIiQYxi+rdYQbasHHEI2XRpRCL5X7bFwzSsxSOoeS7gNcGTIFivWcSf/6W5BUKWPlmKi
         oW+ngE5W8wg4pewL8T0VZpj7SJGQ+533J6QxKePf0slZToEpuqG/dIohAD9pwi+793H0
         J3ww==
X-Gm-Message-State: AOJu0YxAAiLYlNR9eGz1fZ+pCOKeuE3elMB57cPfh8oBeSr7KSOSnIJM
	omjEAoznbdu+oy2mAML5YxGyJEFbHllcdQwI2R5mkuoJ+/w7c+2mxHnCd468huR/F9XSSLs0ApN
	q
X-Gm-Gg: ASbGnctaBV9voDyASSrq6VcnQh+jAuwLR/AlkbLzJ5ceQoNgILgULb0GrY2SQghEF2E
	k2HiH9EVhlGBBZblXQOldnUCyxO/GajGujPqkqLc/2V7bEAZhgUOXvCyaMew5bh/skqiehzsRl7
	FXoWOs3iA3PKRFekUUrf5qbUyimJyKIvLCVhc1DGGXL2w/IDZlWx+REvmanFfU4iuOAPr4syRnF
	up93wlRxd/sZhpHBYeC9C2roOlp02IEe3FatqEr4RDsjNzbGQla3Ip4u+Ws9gyQHHRNbReOTPNZ
	Mwy2mzIC8pHT4vORiv7kifJi6g==
X-Google-Smtp-Source: AGHT+IGUQtsQMWeL+Cw5VWWwB7tLfROHn+crDQsThNa4JbiEtngLOHIUEAJZuFBkwf021ae7vNXFpQ==
X-Received: by 2002:a2e:8e71:0:b0:302:5308:ba48 with SMTP id 38308e7fff4ca-3072ca7508dmr5869361fa.12.1737110244285;
        Fri, 17 Jan 2025 02:37:24 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a35a919sm3697731fa.54.2025.01.17.02.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:37:22 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] trusted-firmware-a: fix mbedtls license checksum
Date: Fri, 17 Jan 2025 12:36:47 +0200
Message-ID: <20250117103647.490244-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6336

tf-a 2.10.9 uses mbedtls 3.6.1 from 3.6 branch which
has the same checksum as in tf-a 2.11 recipe. Found when
downgrading tf-a from 2.12 to 2.10 to debug hangs on zcu102
board:

ERROR: trusted-firmware-a-2.10.9-r0 do_populate_lic: QA Issue: trusted-firmware-a: The LIC_FILES_CHKSUM does not match for file://mbedtls/LICENSE;
md5=3b83ef96387f14655fc854ddc3c6bd57
trusted-firmware-a: The new md5 checksum is 379d5819937a6c2f1ef1630d341e026d
trusted-firmware-a: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
Mbed TLS files are provided under a dual [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html)
OR [GPL-2.0-or-later](https://spdx.org/licenses/GPL-2.0-or-later.html) license.
This means that users may choose which of these licenses they take the code
under.

The full text of each of these licenses is given below.

                                 Apache License
                           Version 2.0, January 2004
...
  `Gnomovision' (which makes passes at compilers) written by James Hacker.

  <signature of Ty Coon>, 1 April 1989
  Ty Coon, President of Vice

This General Public License does not permit incorporating your program into
proprietary programs.  If your program is a subroutine library, you may
consider it more useful to permit linking proprietary applications with the
library.  If this is what you want to do, use the GNU Lesser General
Public License instead of this License.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
trusted-firmware-a: Check if the license information has changed in /home/builder/src/base/repo/build/tmp_zynqmp-zcu102/work/zynqmp_zcu102-poky-linux/trusted-firmware-a/2.10.9/git/mbedtls/LICENSE to verify that the LICENSE value "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0 & Apache-2.0" r
emains valid [license-checksum]
ERROR: trusted-firmware-a-2.10.9-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/builder/src/base/repo/build/tmp_zynqmp-zcu102/work/zynqmp_zcu102-poky-linux/trusted-firmware-a/2.10.9/temp/log.do_populate_lic.4070974
NOTE: recipe trusted-firmware-a-2.10.9-r0: task do_populate_lic: Failed
ERROR: Task (/home/builder/src/base/repo/build/../meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb:do_populate_lic) f
ailed with exit code '1'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb
index aab78477..febdcb4b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dd
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-3.6"
 SRCREV_mbedtls = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
 
-LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 # continue to boot also without TPM
 SRC_URI += "\
-- 
2.43.0


