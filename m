Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767FDCD484F
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 18:26:24 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.5018.1695407175328224937
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Sep 2023 11:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=AWbCVmEc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-773b4a711bcso154129485a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1695407174; x=1696011974; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOxRYwWC5Gtnpv262EEB6NxpFPDCgMWj/YzjwhdRFVU=;
        b=AWbCVmEc1GB8ysv0CkW233oqOP2E4KN7NquyZxiPIeEuj6qGX5XGxwpHLe10OrjELi
         QNABv0qzEqpqVYSEuJlJ2JFJlBjTze06N5Cp663DslMaxrUmDAPDysZ/FhGVs+fguxoy
         S96g3pcF8hQUnhpRWNCILQX+YuEmmZq+yvKXO+cmCeaBJ0iuBkPCRWKRPN0xsMG5GLpb
         WGUm6KWPDbxLDqmasRTYhyzoOUcn3Tj0BkDCWfhx51CMZtUZUZsbiiaPDFXvEsfxUS0R
         YsapaSs2y6Qaxmz+F910uTOEQ7LLCg7B19h44HbwT0inIAtv3Fdk18El4G+bD9RETTP9
         Du2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407174; x=1696011974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOxRYwWC5Gtnpv262EEB6NxpFPDCgMWj/YzjwhdRFVU=;
        b=JtcnB99c6jfOekkMY/2fLGBiEvq17CQE/kuDWU4johfQktUMtflIg2GwMvhg2ka7+g
         gSOO1N6+/EA6xGL0baEZD69zN/qARb/5sUha+lxzstKKQatlES6QGwAzxE2Hik9WkqgP
         6QpRP2cx0F7qPH5fVePhL/+9TVwfVQswvlWGqoQgdS1NPyUsBkImmreqntnaq5o+/j7I
         0IZsCxVoFXpyE6ZPriYfPCQpTrrErxI2A8uavfgCUtGMrZQkTN4+GcNTwx1y1l6xMwMQ
         EnaVF1E+qBeCoGvo+GJdVxa63yhrnB0KEsZgzIX+/SpGy9142XYqisb1z9Voh29Dc+9/
         4MqA==
X-Gm-Message-State: AOJu0YzhHELX0/xfnCsJBjNU0bMi4XoUaZgLNDVaFSq58iPOGCoMQOmN
	82BpG1nIiX9V4ZETfLhedvJ1EB2qZGz6ZK21ZL4=
X-Google-Smtp-Source: AGHT+IGloIAG3fC/iqZXDqUu6xFK0XEMiVTUjjb9YT5UzcsEk1S9D3WckrZQFSP8SY6GjbHVSrYtCg==
X-Received: by 2002:a05:620a:51d0:b0:76f:456:38fb with SMTP id cx16-20020a05620a51d000b0076f045638fbmr178360qkb.31.1695407174006;
        Fri, 22 Sep 2023 11:26:14 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c15-20020a05620a11af00b0076f039d87c6sm1610561qkk.82.2023.09.22.11.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:26:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [PATCH] libts: tee-udev.rules: Change ownership to tee group
Date: Fri, 22 Sep 2023 14:20:01 -0400
Message-Id: <169540680443.309200.8053519607883222915.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918190452.62938-1-javier.tia@linaro.org>
References: <20230918190452.62938-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Sep 2023 18:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5068


On Mon, 18 Sep 2023 21:04:52 +0200, Javier Tia wrote:
> tee and teeclnt are there to avoid running client applications (CAs) and
> tee-supplicant as root.
> 
> - The teeclnt group stands for "TEE client" and is for CAs (CAs need
>   access to /dev/tee[0-9]* but not /dev/teepriv[0-9]*).
> 
> - tee is just for tee-supplicant to open its device /dev/teepriv[0-9]*.
>   No other process is supposed to open that one.
> 
> [...]

Applied, thanks!

[1/1] libts: tee-udev.rules: Change ownership to tee group
      commit: 0221098739b0923c313945af072e1f9017a570b6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

