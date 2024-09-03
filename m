Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30023CD3443
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:32:51 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.26448.1725377567971816146
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 08:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VpcXZb/a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-456930b923fso22387811cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725377567; x=1725982367; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BPdtRcjpeCnsa6za60wfSzC0Pa2ANWOjMnEOv8a9is=;
        b=VpcXZb/aUx1SRqna6Rwn4Yxpu8Ngu8Dv+p+BfpUYElTzPPtLT05bUf9xpuOqXoOk3T
         N/PurJQLMlG83Ki49K7WgURmEAEhWnEeLiOU7Pq1MKDLjIMhoZ84qEszhjDnBL8o2ag+
         Zxawk4Ge7VzoO0pphqJ2faWaEZaD8zm/QwIk+ugpQ9ivB5IIOCsmP9zwYtz5r+3LC5tx
         DZAVinQLr1qgrFqFtEPv8paqMtdZTbSKx/2br04kYAA8RP/x+fEnpywwjUngxN6YYS60
         Gofrv005jvY9otODtags7r8ePmk07QjmHSN2hRAm3rhNPWc6vm3JbGhg9VC+zekTHvzB
         Ym/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377567; x=1725982367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BPdtRcjpeCnsa6za60wfSzC0Pa2ANWOjMnEOv8a9is=;
        b=BaN4AKyI4mJ2HthbSuN6CS5ieY5d88wvENjgqvV/YzknEeW+y7xNVfo9PgzCVeQigS
         IOXwI1De8LT4HGA0msIRUoWDPV6/VDk5jo0rrMRJ0L3yH/jnDWgD9c3WJ7ThAmxlZgB+
         CCbFMAq8ECYjyaRlmXGYSNWrdPy3T7lDLcJGadp5reo3UyqfMNNZgunj4SNIMClUvvxM
         L0o6tg7XWf6WIm3k4HsVBlK8bdm1mSj2GfESxTlBP0tAEM1xf8xuULn6PKI52FECGM9M
         yv0tUaNe9cEf59WXbYC0n5rbrpKYW78WAW3AVl9FHXo0nLTr7YQD+qkkM98uD4RqHDdZ
         jzvw==
X-Gm-Message-State: AOJu0YxYoF5ffXnqGUDAUGVQJOx157XJp22gh/rfUNHc2zGa2lNt+hG6
	v39x5Qx4ih9Oe9r3l2NLUD/eIrsoch/oaAzy0CsbmyuV2Cg1zRGOnNNHgrRIk2k2eZO7EWqzgfU
	=
X-Google-Smtp-Source: AGHT+IEfy0H24K6LccFHS3l9tHCnZ8V5KADLEKef412TyJva1S1tGYsPgITuag3Xc9dtUhlHEG5MpQ==
X-Received: by 2002:a05:622a:4c16:b0:456:8732:1878 with SMTP id d75a77b69052e-457054334bbmr132277651cf.59.1725377566723;
        Tue, 03 Sep 2024 08:32:46 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d9573dsm50622461cf.84.2024.09.03.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:32:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] arm-bsp,kas: corstone1000: enable External System based on new yml file
Date: Tue,  3 Sep 2024 11:32:23 -0400
Message-Id: <172537754408.2698594.10831128446988672963.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830201448.3695005-1-harsimransingh.tungal@arm.com>
References: <20240830201448.3695005-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 15:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6054


On Fri, 30 Aug 2024 21:14:47 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> Create new yml file "corstone1000-extsys.yml" which adds "corstone1000-extsys" as
> new MACHINE_FEATURE.
> Based on this, external system components can be enabled or disabled from the
> Linux Kernel and U-Boot.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp,kas: corstone1000: enable External System based on new yml file
      commit: 0f87b7c46aecaae54b339d75bf8e25c1ae4fe951

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

