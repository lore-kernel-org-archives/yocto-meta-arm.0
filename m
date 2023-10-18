Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA9ECDB47E
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 02:31:26 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.18593.1697682680872164228
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 19:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LZm1boG8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-66cee0d62fbso48571426d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 19:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697682679; x=1698287479; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsEa2ofcKydGgcec+sc1cuJ13k4zqBj37dz7JP4HwHQ=;
        b=LZm1boG8aC5C+KqHswNjLhVz2S2pH845KZkg/dOyEQx9HdCPB82EitqO56nbFEIMs8
         PtIAQhyW+1svKWe4BuwSjctChaffVst6IA0reU+j/0gGVkhEqJSaltDwysyxxnd4iXsa
         0kscpncPJcYDjasabV1QXv/ypOroNa0BKWySlKhoSCmZwcRsAF7wcdhw5Rp5DQ7p6ojp
         1p1jArgUWDE5+U0m0Vz6PV9mOwWkCXsm/jQstu1kbZatD40+Wz2HiReRb0PwhWT4MBED
         kOPiLK4nvE/vGKmKcippJCAJgiLiGvrBYCiuS01Bu1qeYRf1mddx2pOrI6wYnfOIKC2K
         MsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697682679; x=1698287479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsEa2ofcKydGgcec+sc1cuJ13k4zqBj37dz7JP4HwHQ=;
        b=E80DpQLSrNoH74zSrAesxnHwM49XZteWf+47/lreQXzE9PEmfVWBkS0OAh5Nn13kJT
         GGVIiP4C4FWOfUGs6dyPiEXPGzoLnMEI2DtG6OmD9sUN5N6PZXBuTT6zadJ1p6rdW5Ts
         auRISySz/IYkxxB6X18zvOFaPii4n2CV3CA0hcQ0USlkO4QzF0FL0/p/zOhQP7do7LDz
         tvo+Ff8Y905jay44TfXahHU8oum1b18LHcaRTLW1e4EmA3f1vRzn13jD9Q5ix8K4m95r
         kro6ocRo40hclw2umDBKGSWmX2qZ05FHFMBzZngx779PMoJ5ZIK7rVZ4LZ7piLNEpLmZ
         TXxA==
X-Gm-Message-State: AOJu0Yy07xAesCSl3Mp0FVUyE1ZbDggLtJpRPtzTpYUoaYx8M9fYLUMS
	9WUBxBqRBYODqL2gASGVY4CH6qSyPxCb5GvruEk=
X-Google-Smtp-Source: AGHT+IE3/bLu3HsNWcbshCAFdHaHQQJdI0HLUY6d0DnSWJMPvb7rYE/6J17Wda4ilh7HsHdmxY9izg==
X-Received: by 2002:a05:6214:d85:b0:659:e547:ca72 with SMTP id e5-20020a0562140d8500b00659e547ca72mr906467qve.40.1697682679331;
        Wed, 18 Oct 2023 19:31:19 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p9-20020a05620a22a900b00767dba7a4d3sm424389qkh.109.2023.10.18.19.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:31:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mariam.elshakfy@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/n1sdp: Enable OP-TEE Cache in N1SDP
Date: Wed, 18 Oct 2023 17:27:59 -0400
Message-Id: <169766448031.3620860.4920275787793380487.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231018111711.4602-1-mariam.elshakfy@arm.com>
References: <20231018111711.4602-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5147


On Wed, 18 Oct 2023 12:17:09 +0100, mariam.elshakfy@arm.com wrote:
> From: Mariam Elshakfy <mariam.elshakfy@arm.com>
> 
> These patches enable N1SDP cache to improve performance,
> change location of OP-TEE from DDR3 to DDR4, and reserve
> the used region in UEFI (EDK2) to protect against
> allocations by UEFI applications.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/n1sdp: Move OP-TEE to DDR4
      commit: c3ee38fca534fd7b84503adc875086843403b96a
[2/2] arm-bsp/n1sdp: Enable OP-TEE cache in N1SDP
      commit: 60eab95971dcef139e76fd2ead3b663b5a87840e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

