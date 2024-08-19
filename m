Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE7AC5472E
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:44 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.1073.1724094275628538552
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vDeYlmUX;
 spf=pass (domain: linaro.org, ip: 209.85.219.51, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6bf6dedbfe1so27997076d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094274; x=1724699074; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNsnFRtx0GTlzGiTySEEkikY6bEysngPXY/quIReZh4=;
        b=vDeYlmUXvdQ8KwSL03RouJB7eR+ctsGcDRqhtzxH+Z/pVcCsWvRMbJz7hr0Lu2Ka7m
         8Ov3gvlX5F2cWhQBilaq+/3p4TJdNcENthocTJvETFw10F5EzQjBAxWwDfXZDRD0ir49
         lbfVCmAirzp6GZLff3Lhcfbn9noNmLlgUggG6SQocJmAX29dkZYEtzz2+xzK7Tqznzrs
         LmbcVZ8ZYvMqRkfj7gjoLF1Q4hbA2J+9Hr81Ixxc9XuOUUazVOYQEKXV05UYFVHhXt7r
         erjN9BdHc2VhsRHGfHWOTfmrqzJn8dgJ3QjdtCKIKIEv2LAIWkjZe69eKJTZZ358yQFi
         OA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094274; x=1724699074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNsnFRtx0GTlzGiTySEEkikY6bEysngPXY/quIReZh4=;
        b=V1+bwzqiltIfXuZUsW/+9kd6JD0pH8TjKi7j3mnbllO55RfCG5EEAMw0aNT/DjbuDS
         aAwTyTK9+Kw5NFL693DOkBJOPPcBjfDvWrkp7tHGGhG+JOQkLEwBT0O4ExzUdoSjmqDe
         2juRj4V9BhRt+4AuIVvJ6fYV0KSR1hlq+PMeDhpG5FyWMzmgh4HqboUYIzWI1tNA/Yqd
         60NtsOVHxpfDEk2BwCj6B4xO74Dq4qD0csllUi5ElVGpIEZL+XEHhkycuLORZVlfzx7R
         dyalGhtAJhYpz1nd2jHxvmUTnYHU3sOPo0idK3ma2T+EGXEjPPWbCbkLsf9lvb6+NbqK
         KwBw==
X-Gm-Message-State: AOJu0YxNfGBIjVp/PYfq4ROtuTmwIYnvfENetBknkvI5BdEM6GvzCcO2
	krbwUfac3wJ+6VSfvY6NKJWAZZWnsMe5mlwTXl1tDtOyMcJj/3W8AimIVIYpdhMsptqaxs19Aej
	/
X-Google-Smtp-Source: AGHT+IH/tQag3z1K69EY6szuGGxrisbwrg3ocn7FNPMaO3EpcnpgmQLoTZ5ZmZopPhdXDsLILvANqw==
X-Received: by 2002:a05:6214:3d07:b0:6b5:e895:82f0 with SMTP id 6a1803df08f44-6bf7ce5f9c0mr159814596d6.43.1724094274545;
        Mon, 19 Aug 2024 12:04:34 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:34 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 01/14] qemuarm64-secureboot: Introduce uefi-secureboot machine feature
Date: Mon, 19 Aug 2024 13:04:16 -0600
Message-ID: <20240819190429.2897888-2-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5967

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index 55c4cab4..2669be0c 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -23,3 +23,4 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "uefi-secureboot"
-- 
2.46.0


