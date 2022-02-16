Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F60C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:42:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.3127.1645036947860072157
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 10:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUvAdV+y;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u5so2681654ple.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 10:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNg8HsjittB3/HzHIH2sPB/YTnbtsr/1Irz+W2Ds08w=;
        b=EUvAdV+ypTIh39+2NRWjolqF2cuwtiqNIkipORdooI8QhO5aUikxc+7LfKylzzEqIp
         OJqJrmQjCVaCCWRbW9cbDh+G1B8MtAYaUUF4Q0aWgQrB+ubnPvo3qe2ivxvRSyOLnZ3b
         Lw7qAlpu7gVirbH8E5oMdqp7X8lhOafD+54hK7L0rcf1LlqXWHKZqshQ06/9Zf75FVWh
         hQVpQ0hR4wIz+SQQOlfbAf8KNbyoS9LxS6vuGUQdyk/RimTy4e+HiETfvoPQaeMZm7nM
         fwX0BprdKZ5+zYZ2EHmT2feAPdOSQbGaC+dh5rkEFIml2ITQiKVh+KcRLpSHebO7SZBK
         A8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNg8HsjittB3/HzHIH2sPB/YTnbtsr/1Irz+W2Ds08w=;
        b=FI6uaV58mZ7ebMExqVAShQoBnLHvhBjl/AoV6BcpjQTqhmbGQxsmD9nOl+o5dU3moq
         H97dlq2wTMtTWfZ9vKI/MXcsjUzO1FwGJGvSL1MSeSrIvttSq8Fnf99Vz25nhGfrAvZX
         EHTwOJdqgCe9QbM36KQVL3emIUf5IyXy7SM9+wpDpiYaryN20kf9y9FHuVmK79YpZA48
         oXQGMxchfEtuq/wcjDLs8Kp5O5G2yRcuKiPYotQX8cpOaT8ZOjeOE1OzXDWv7K8FYycV
         nxaCN8qatrv47o+HnAsDT+6RpZvgWlIKATgXolhDcPjz+Iy9fB49yvnTfgKzceVzxh+6
         aadg==
X-Gm-Message-State: AOAM532a1CCyY9zHtHAcBPsyKFw+rRe04mQD+fJeBUkWawjs4wOuvb45
	xOgX7r8v2PLIdb+BL+vYpyq0dtE3aNGNug==
X-Google-Smtp-Source: 
 ABdhPJw0VFioznlaRpggmLsbxT+Me1E11wbXZhltpGzhZXYLqWpWn2397ovqPSTRmghtIK2p7mpg/g==
X-Received: by 2002:a17:903:1c6:b0:14f:45c3:6c29 with SMTP id
 e6-20020a17090301c600b0014f45c36c29mr3596773plh.77.1645036947196;
        Wed, 16 Feb 2022 10:42:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 my4sm10108627pjb.13.2022.02.16.10.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 10:42:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] meta-arm-toolchain: Use renamed BB_BASEHASH_IGNORE_VARS
 variable
Date: Wed, 16 Feb 2022 10:42:19 -0800
Message-Id: <20220216184220.3494070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Feb 2022 18:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2997

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-toolchain/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index fe23fd4..778910b 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 # These variables are used for armcompiler license
-BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
+BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
-- 
2.35.1


