Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E857CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 13:19:57 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.10743.1712150394564671427
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 06:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=IW+3SAyC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.54, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so3791164fac.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Apr 2024 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712150393; x=1712755193; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uq+3/tCaaq7ffRcm1wwSt6mwD7c2oWxnpgW/oWFx1TE=;
        b=IW+3SAyC6ekaxa9rtyDy8j2jcFKaXcpiI1+d6jrX056mqGqQWsnu3yUnEhlS3bC2el
         d3+DpUHtiSo3V5sGY6wIT5jBgMsySig8Y8YJD7HBH9AMIkNhVs+bVM3bTzlu8uoJWUgO
         +9ujE3HNYl2kZYAhKqyYGewnwuCVmSqBIppQ7ADjrIJs/6yVSgEr7Sd/WUY4WDkDiste
         UUTuGF1Dgz5k69CoI5QzYrByIDzubjEk8ZneIaEPUQ4394zt9PR0QtOG84JGdvR+cJuV
         CvFe/yuEJg6hjQ2gE8sywiNxLxH9YBR53yMKtIPTbLTADPb9hLEGkrbwnHCsXAPBD4W4
         J7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150393; x=1712755193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq+3/tCaaq7ffRcm1wwSt6mwD7c2oWxnpgW/oWFx1TE=;
        b=ItS3y58KGdGAqZ8oULHVmcMIb5v3pPzw9aGcswrH0FJmQIQAIMHepVE2QNZuo6gXOp
         cdAAuIWRpokpAohC8boEvM9oEORjl6vzAwneSm8rnfc6/hSYOtOlRT1jwkKS+Z6T1Gjn
         Wc7B0/X8iP8GYLfD8jJeAgbOfSjn+Nj3Hj47VIIF37sQTqk0t6HeqDRs5l3f6jQMeVep
         0UrJzbVh20eo+TJzOiL++djJedMFlHMK/qiRUm3/cc3P+iVhrIO/9XzepE2eKFdvq4fe
         7KeYATLvqwVXXmWkkBXkmmXjWssbNf8jXeG48qxPouJPzb3jOmKr3acMLgCmdiggasKg
         ZCng==
X-Gm-Message-State: AOJu0YxRVLquxM3GKyYQ3a9hP85nKONOgHb8310CAeqRjGI31Yp83sTJ
	CDLMDKJJotLRLckqtgMCC7BNK32uM29YpNfq1pjYxLQ/jfZG7wbTtx0mxTulPM/GOXU7lHazhN0
	=
X-Google-Smtp-Source: AGHT+IFCqAvG4bUiHJEhKS2rGTKeh/G3HckfeYpRjUmzhLhJUsmB5p2B4RKJPo0eIJ8TAmS/GihmYg==
X-Received: by 2002:a05:6870:d8c6:b0:229:805e:ddce with SMTP id of6-20020a056870d8c600b00229805eddcemr2875080oac.22.1712150393602;
        Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ga23-20020a05622a591700b00430a44f49dasm6574108qtb.7.2024.04.03.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Subject: Re: [PATCH] arm-bsp/corstone1000: add documentation disclaimer
Date: Wed,  3 Apr 2024 09:19:19 -0400
Message-Id: <171215036234.4122560.4093326045313104057.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240402141846.48855-1-abdellatif.elkhlifi@arm.com>
References: <20240402141846.48855-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Apr 2024 13:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5507


On Tue, 02 Apr 2024 15:18:46 +0100, abdellatif.elkhlifi@arm.com wrote:
> add Security Vulnerability Disclaimer in Corstone-1000 documentation
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone1000: add documentation disclaimer
      commit: d9e18ce7920fd4b6216fbda6c7938450aa3b45b7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

