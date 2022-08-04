Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7DFC19F2C
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 09:43:14 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.2878.1659606186914104116
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 02:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TRbshwYo;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m4so14059578ejr.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=YJEIlZuLUs6YPk+t72L0+OFqQ1h/qrgvrHQbOUBGdg8=;
        b=TRbshwYobG8ZN1rlRKabr92liq4n4mYceBuTJOuxuqfzX3NERdS3f0KMjCDzdG1r5Z
         VpYPz8rNN7VqgiNW0dGAwMUBI8YWqDmKjLN3v/UNOMhZ/Mz6PHEVfALAOV5jhyMY1MW+
         lDQaFP006YvyY43yysSkwW7JNn+gk2i8K05WrYtb2jB79WnNCxy3kfo225Ug2ZvHzEvV
         bEhvIj3Xm4Q66J29h797oMWnVyha58SkUAXe0rL9X9DQVRIb4+TAPB8/NPfQQq3NoHMt
         il1E4UackXs8DYSfvUuGX4fXgb6KbGoB9DKS9Pe9vNxEet4O5CHqG/03wJdVIKLQCnsd
         kIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=YJEIlZuLUs6YPk+t72L0+OFqQ1h/qrgvrHQbOUBGdg8=;
        b=ALps3BvnJ7bENotQXOob3V+S07M500hfpje8Qp61lIHCyN2o7ct6nnj5AcjuHrgUq3
         Vw+1JY73hxi+d7zTXV0GGQodyKbEtgVoIGjzQaiZ1sybUrcjSE/sFUETTJYNetBoM48r
         aQhb7A3GCWCOIJg1dmzR7yj+4jEy6xIrdmXyQgffjZSb5xPdTenla0NhoOUSnu5HDkOc
         TXuGoJ1TL3SpFyUMEPwh1792rVw8ghLRSTby5iA3iAwP+to2x+Hkjlz2IjE+uBs0TLJg
         DxLKN7b7k9+axNHqpd9WJXM6iDVhDvgwEpBF6983pV+893OuGLzVsWPAh0XUpPhrxzQd
         ijOg==
X-Gm-Message-State: ACgBeo1S/VLuo9WPzXUBDgPiFZtdTgL355vy0Y2oxFTkt2uO6oOP57kQ
	KfHiUel3/s15GwycCO1zYIuvYWupEJ0=
X-Google-Smtp-Source: 
 AA6agR6lHgIQOUI+8xby2EjNNrgOy/Od6d9ZXbbI5ec51cfml2twHsCWmhen8fEfWLE+F0kO3Iol6g==
X-Received: by 2002:a17:906:9b8a:b0:72f:9e7d:c458 with SMTP id
 dd10-20020a1709069b8a00b0072f9e7dc458mr762675ejc.213.1659606185303;
        Thu, 04 Aug 2022 02:43:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 y17-20020a1709063db100b00722e603c39asm170495ejh.31.2022.08.04.02.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 02:43:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][kirkstone] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
Date: Thu,  4 Aug 2022 11:42:31 +0200
Message-Id: <20220804094231.748681-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 09:43:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3641

From: Ross Burton <ross.burton@arm.com>

This appears to be historical from when the toolchain was in meta-linaro.

It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
grub which is part of oe-core, so will never be dangling.

This variable has a global effect, so leaving it in here has a negative
impact on users.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-toolchain/conf/layer.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 3512c34..dd54db8 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain = "5"
 LAYERDEPENDS_arm-toolchain = "core"
 LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
 
-# do not error out on bbappends for missing recipes
-BB_DANGLINGAPPENDS_WARNONLY = "true"
-
 # These variables are used for armcompiler license
 BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
-- 
2.35.1


