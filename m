Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F9CC52D7C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 01:43:48 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.4148.1724291024011860288
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 18:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dntNEo3h;
 spf=pass (domain: linaro.org, ip: 209.85.128.178, mailfrom: javier.tia@linaro.org)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6c130ffa0adso4089257b3.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 18:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724291023; x=1724895823; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67YVObMV6SP0FplyibT0H1Uqtfes6/hXjLaUrIj/5iI=;
        b=dntNEo3hYEG7QdRm0C8JPdItp6+e2ZylNxZV1qtqQ5EfJf38xupH8TEgZV85YMtcns
         iIt37v+sMcxupMHMPot+k/3pwXOQLr04U+Z2gCxIypKyQjyojFRScpxS/8Bk29M4Z/qp
         Lkt78s2ROLQgd8b7vPXUxKOGfcmTrtzpUbrwZOy8hWkCg/z0qhvwLw0ddfwF0+OY7wVN
         heBXhp1k49YephaqLPpcIsTYQ7CDBF7Kfshq97/FnzG3Z1OwFCT1qps0dJlzN2TFlfOF
         y5ktXjjb4oqoaKCwMPrIPfFbX9HoqZlzKABUWreOp9dS+YNi7lsvn1tljtNw6U6lhKLD
         /Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724291023; x=1724895823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67YVObMV6SP0FplyibT0H1Uqtfes6/hXjLaUrIj/5iI=;
        b=fIINHTpBpWgwMqYF6q03HgvqHhjmSiikJ/cRvmpg1wpVkK9N96FtVxa4f9+OPYbrug
         IYMV3jyOhGEJjwDOLfbMLqKVZkYUaPReyFLr4sxbsInt4Ui0GDkYZthZ0a0DdNxpVPj8
         KNdZG/FwIknGB5BhB98T14scikCNdQ/XfvubVLnv79zXtAF5kOV0JHNovm+oPeSOxQKf
         4tKPeUwaDZctw6oRGl8vnLBzZB4xJ82z9rSt4MwQoOEQ/PGGWgEEh6lIZG9l2We5kDBW
         dCli0eM6qoTSbgJhQm8UTozI1mPBYGVddS2Ojp+zZbX7E0nE1SW0Ssu+mMu3mEs2olJU
         BORg==
X-Gm-Message-State: AOJu0YzNDxB+dKdl+Qii6NtmKSwZ8Y3dxtukrJcWsb0j0POtg+hZOJ+n
	mz0eLk+eNj4gF4p+kxWDdNCoC9KTibwxsIOIG8q4aWE0eTzYnMD1KQHMRXQBCjHoB/vnn9I+EbO
	g
X-Google-Smtp-Source: AGHT+IHGIzUGRzSqKE+E7cQmbJebb7VAPPUVavIxjFVmHjO9nap2k7RQ3CJgiNIHqowQvecr3x3vIQ==
X-Received: by 2002:a05:690c:428c:b0:632:12b:8315 with SMTP id 00721157ae682-6c09d8de9f1mr40963697b3.22.1724291023067;
        Wed, 21 Aug 2024 18:43:43 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e6eae07sm707757b3.145.2024.08.21.18.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 18:43:42 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v3 01/13] qemuarm64-secureboot: Introduce uefi-secureboot machine feature
Date: Wed, 21 Aug 2024 19:43:23 -0600
Message-ID: <20240822014335.3394568-2-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822014335.3394568-1-javier.tia@linaro.org>
References: <20240822014335.3394568-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Aug 2024 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5991

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
index cfc6ff77..6789b1c6 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -25,3 +25,4 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+MACHINE_FEATURES += "uefi-secureboot"
-- 
2.46.0


