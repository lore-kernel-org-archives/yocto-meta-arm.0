Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B72C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:16:41 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.6152.1743754591286189326
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 01:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gUrROqXZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc04516fso1642812e87.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743754589; x=1744359389; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EKVrhsKwqlj9cu1qf9EhQ7z4RfQTs5+GfTW2V9EdS8=;
        b=gUrROqXZfy0tadk7nqQqbEvsZGPbB8aPL7DX2teeIjBtv4TlgQYkZvADKfVtCQ3Pf3
         kzMmsHArL1TcHpDtpg45zJHd8+LlMy7iMb6uAjihC/jStjL20KWm56lC/hDJsi/DzsED
         iB8b0i4QeCxSjDNzKDJTZodgZC6MYuXpDiQpINiTR2kcU3d33YP8qsHQ7rmd5tOakzYm
         GuuaMSb5VPaoTsX0zj0e8odfFVHLDw++QL6EPoFwIXBz7j2u6STMkU5yvNNkTdZ0RkVi
         udl0bMBrsZWb0iwfRXnYozC3uykZG5DB+VPd+UL5Obz917FwxsEIF+uyxNCfqduDvgtj
         MVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754589; x=1744359389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EKVrhsKwqlj9cu1qf9EhQ7z4RfQTs5+GfTW2V9EdS8=;
        b=EzOLun1BPAy1zUxahfxV792h9D4UdJYT3oLVyl/DWMMkrNY3g4R2wCO0RPA+FNVLYh
         kSceAGLaJDdM076PraS7N1XaSKq1KRuGa9TM2bcNlPoblM8pWU2SNXuYpIyXY8MqsE09
         DzNitgdctMRw9C/V/pFz7bWKDg8XsgpTOSLSs1IqfkBJ00bvK8fTkSemhKnTrvG3xPei
         oM8hRDZIPoYM9lzNk5R7Zsv6/U5tGM5nT1boBh1FHAnR3LLdZSdElk4NNqWKbWvIEQ3E
         5U4miVaVwEiMpc1Q2L29Jidp0SStej+UyodjX+vTDcQxZJZrors5rWEYibG+occH7VIu
         BHLQ==
X-Gm-Message-State: AOJu0YyNwSp8K6lCcAInD6nN4fFYtl8ZQGriTJWCfuh0iFQYb1jboGii
	p4urOmjuUN47RlB5OYGhnUbC1f5/9Z/YkF+xB7q7ko1ar3zna6pMjRddqRdQYgQXqyJ2Ret1vJm
	Q0ls=
X-Gm-Gg: ASbGncsNq/jTSH71/z0yXYGAQu0P+U9nUH+5HOYbUStMK11U298JwAnznj6O1avrjlV
	caqxxl063yRj4IS8MXw4+veiSjCbmfkR7PFx3OA76YwXLs08n5P71zve5DSNpoJYN/1M3yMqVMc
	ABPMC3nJx49VcdntOZPibO9OTCUABMkEegW+GhDOH+9zblhv8me3sFnqLbFSIEJNUBEKkgQ6VYp
	ZrM5ksPDAQgjKyJmIvqGE7Z1fTdWfl8N/FtkXw7DtLaD/Gc15U2SpdWRLmQHikbhMxOyJA72SHN
	sfRHYH1HIYO6IPoxkhTwzJDWdK0g1Z04ICpeC0HjyVAIjQaDNJs4RM8PtphTso2sg4z6JSvJR7V
	Tv/FkIkex2CCkxxYpMrVeZw==
X-Google-Smtp-Source: AGHT+IHW+iFqgA/lxZ+Qsx8AOOigWdBkQPYtOUpoQHz7BXyvruB62SQ4r8LZTKlKVihUUpU9DQHirA==
X-Received: by 2002:a05:6512:3b1f:b0:545:c7d:1796 with SMTP id 2adb3069b0e04-54c23346b98mr463767e87.43.1743754589352;
        Fri, 04 Apr 2025 01:16:29 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5b51b5sm365981e87.3.2025.04.04.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:16:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] trusted-firmware-a: set mbedtls git branch with SRCBRANCH_MBEDTLS
Date: Fri,  4 Apr 2025 11:16:06 +0300
Message-ID: <20250404081606.388767-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 08:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6441

Enables building latest bleeding edge tf-a and mbedtls with
local.conf setup:

INHERIT += "poky-bleeding"
POKY_AUTOREV_RECIPES += "trusted-firmware-a"

SRCREV_mbedtls:pn-trusted-firmware-a = "AUTOINC"
SRCREV_tfa:pn-trusted-firmware-a = "AUTOINC"
SRCBRANCH:pn-trusted-firmware-a = "master"
SRCBRANCH_MBEDTLS:pn-trusted-firmware-a = "master"
LIC_FILES_CHKSUM:pn-trusted-firmware-a = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
BBMASK += "meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.12.bb"
BBMASK += "meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb"

This includes workarounds for poky-bleeding.bbclass which doesn't
work with multiple SRCREV variables, masking away
tf-a 2.10 and 2.11 recipes which cause recipe parsing problems
and only one recipe needed to build latest upstream master
branch to avoid 503 error codes from remote git server.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-firmware-a/trusted-firmware-a_2.12.1.bb            | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb
index 57c30b58..47ac8722 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM += "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee
 
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected version mbedtls
 # mbedtls-3.6.2
-SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-3.6"
+SRCBRANCH_MBEDTLS = "mbedtls-3.6"
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls = "107ea89daaefb9867ea9121002fbbdf926780e98"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
-- 
2.43.0


