Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD4CCF3198
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 07:15:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.1797.1727853306122661078
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 00:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eu+tRUUc;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso4178053e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Oct 2024 00:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727853304; x=1728458104; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PIyVnAnlGR3JmUOlzHCeylx8pRsBkPLYfVaL4yQpXjw=;
        b=eu+tRUUcrxzZMX1YaIorJUg9LbrZ2YGkTqKDUqLbjmfdjQvg9a5oM0euoeIvEYUaPj
         N182VsoGqyPu4hTUrXgyk/C+KZzlzlWweRNTJ/BpMEAsWoSkuuSemfykHfQiML8qUdse
         PuC08QTKTiztJcszB7tdDaHwP9OpMlAIzEpOdTXp1FuTMlkiqRknIPhu5Sw/Q844lfgr
         Gznicx1z19x4Cjyn586N2orHZt/A0MPYerqhiJDjNztNYLTkhj3HpcyAtcn7k6V8njO7
         PJw/QxpVgtYko3kDqVhspOsKYf7vNcX5eaGxOQVPBqwYKh+KaYkZSdESv7IH7WJ5ck8W
         iJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727853304; x=1728458104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIyVnAnlGR3JmUOlzHCeylx8pRsBkPLYfVaL4yQpXjw=;
        b=cckYGFL8NmehPj7gm0eQg/O4wrOWO2jV/XxBA8/TznkJSNzGHg4K91XGcppYeiOh7F
         KKVUuiR2BmuzPVIrpCJ4zMtMYsH8P8eSUhD3a1rHPsE3yRLPU0CwWVnlV3fSjULqzXR9
         ToLx5+c0X5LOROQJich+BRHy+dXpVW/1/4KlibEfi7ee4KUtuem0tBodKJqs8hbiG/Pg
         lGJZrMaDxkQ0kT/jJ7rIn1vN5YZ4sVqsXi6jsZtT5kr9wRCuH6tnjwBeAKQZzBLFS6sp
         nqy0bt6w16STCm5TEBlkV7S1JmU+1LmHia8hs+jvIjw9WhInibb0nyOZRv54TZuepLiI
         YALA==
X-Gm-Message-State: AOJu0YzB0slMma/fX/P7loX2MIXASY2ohUTcW4tqVXJrKnPMLNUfflfB
	epjDJRUG2sKWvyacdqAUjBjrbCmDe5LeXR2RbeDzZ32QvsN0OtQXxTIC11DjrSWkX6Ii6WSFYaY
	jYJo=
X-Google-Smtp-Source: AGHT+IEdISi11iUQ9+uvdavBF53ZjRnowP2FzEVjE1JR56wWFu4w3MyrUxQjKmasIScfDNUSSdgoYg==
X-Received: by 2002:a05:6512:108f:b0:536:550e:7804 with SMTP id 2adb3069b0e04-539a0664e55mr900219e87.18.1727853304021;
        Wed, 02 Oct 2024 00:15:04 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a0437f3dsm1817763e87.182.2024.10.02.00.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 00:15:02 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH master-next] optee-client: switch systemd service to notify type
Date: Wed,  2 Oct 2024 10:14:47 +0300
Message-ID: <20241002071447.64389-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Oct 2024 07:15:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6161

optee-client 4.3 supports systemd sd-notify to inform
systemd and other services that it has started.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-security/optee/optee-client/tee-supplicant@.service  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
index 8325b6be..e3039fde 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
@@ -7,6 +7,7 @@ Conflicts=shutdown.target
 Before=tpm2.target sysinit.target shutdown.target
 
 [Service]
+Type=notify
 EnvironmentFile=-@sysconfdir@/default/tee-supplicant
 ExecStart=@sbindir@/tee-supplicant $OPTARGS
 ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
-- 
2.34.1


