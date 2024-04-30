Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961CDC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.14059.1714480676950235417
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HYq3sC0z;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so7083884e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480675; x=1715085475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbmtXQp9Eqk09/rYrsR7nHBq0pwaDSE6oJFDnbeF9ss=;
        b=HYq3sC0zMBco/GBYoTW2ZvmcP6djYGL3XPdfTD+976AcZ8cDinXMPBNiDTI6EksTwe
         rlKM6OMhYJVnO66YtLvMDbZVPVM370Xdde3reM0qBEmpsLznQXlMKAM9SMU4eawGGmeB
         Y15zm2sYruc8dfjH7zJZ9h6g3lhmSRN1r6aHYhiRClR843P8Qa96BRfm883vNBjxJbgg
         p6Yp3H5C35sWC2S2FbeQ43TtB1D4CyS5V9bMtl7EMSuaPStr8PT9QbMk8ZKwhrexK9MD
         JnOS5vdb6J3EuZHGs/cbIhgDgcHHAav9HDlOAJRowK+l4uA8JPCvuc4DfmMKsQfCxmQu
         M3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480675; x=1715085475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbmtXQp9Eqk09/rYrsR7nHBq0pwaDSE6oJFDnbeF9ss=;
        b=A2fGJowIp/un9kStr7YfmE09u5BgwowdKmvZKvB1m0MbLUjZ+g2qDLCf+zLU/bEZUW
         GtuiBRrCMe+iqFz7zMATMzRbsE8Y7LyXxDL84Cnk9C8O4MU0YirZYt+p5TLpqdvFajAu
         tibpl2xb96Yk+6txV8d3Il3c4PM1WXFKQ1MslJnZT1ajqhkoGfYH1FL27wZCe3rtANCY
         utyu7tvD5ll2wd5O33vnFWrrF4AhtQ7bvEzjjpFzek2COc82q+3vBUWjhxWHQufPTzna
         +OwrY+wzyhnSiI1JbpiKvr9dn2Gwz/KkyRC3a7YdDl1TjSRbNrFYrqVspKwXSM2mdi1l
         x7QQ==
X-Gm-Message-State: AOJu0YyqhVq8ucmbavh+E2/Ul39w5LyGqoVJ4GQl3pJJB30fHIWeD4RQ
	vD2NwJwZ8tO0rlBeOOJWjMknvXwxnFtwBJN91PbodvQOGZOUNoXH8hrPPnmhY567+Sz1zIfxUxs
	ibBU=
X-Google-Smtp-Source: AGHT+IFffbbWVHTH+3IIpe22y+mIuA8iFJGVDOdLJv8I1xexQg5Zs5xpn8GYf7hNFfi8q/oDbTSIGg==
X-Received: by 2002:ac2:4ace:0:b0:51c:68a3:6f8e with SMTP id m14-20020ac24ace000000b0051c68a36f8emr1782052lfp.31.1714480674743;
        Tue, 30 Apr 2024 05:37:54 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 5/6] ci/qemuarm64-secureboot.yml: install optee and test both optee and ftpm
Date: Tue, 30 Apr 2024 15:37:31 +0300
Message-Id: <20240430123732.534277-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5646

optee-os test xtest needs additional test trusted applications (TA) from
optee-os-ta package to pass. Execution time for ftpm test is around 18
seconds and 430 seconds for optee-test/xtest on an x86_64 build machine.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index c4943cb6..bfd482b9 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -7,6 +7,8 @@ machine: qemuarm64-secureboot
 
 target:
   - core-image-base
-  - optee-examples
-  - optee-test
-  - optee-os-tadevkit
+
+local_conf_header:
+  optee: |
+    IMAGE_INSTALL:append = " optee-test optee-client optee-os-ta"
+    TEST_SUITES:append = " optee ftpm"
-- 
2.34.1


