Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E68FC4321E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.1291.1650396932805250368
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DKdoYdUc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id t26so4393577qtn.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zhsf9izYR+vCTAny60/SDNwQxbIdlDK6Q37LUQoVgxI=;
        b=DKdoYdUciZ8Tx/n1OMSajxdcXKQF4+IummCacd9dxLGvsGJZvogk2Fmq3qyUinmn8W
         aUm6ZW7+PfQNVGYJ1cq3EeS1aeiEqHSc8H9zGPI+QCItw9U53TYmU4Pv3qY9GEsEGZ7H
         TzpAhVWjoPxSm7LehjL5dGRgWDOg7AzGyp9AQWZ/1apL7kx+79M9luxm3pL/vmCNFZOA
         K/OX38t3o7DImj87Vr91annRte0OlQsUy2xiZQaAgeC19ZYJ0AED+inpWBIPSXN5TAyK
         1EN0+TPTHty3K1ZxKCLQ0iTf8AC3v5mcepNFIK2e3I0Knl3nwArnVYXjRw7UeK4fawHQ
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zhsf9izYR+vCTAny60/SDNwQxbIdlDK6Q37LUQoVgxI=;
        b=hWp26u1meQY3KEbsBCdi8CXC8w0i8SmcWBCwXl0WNZvDs3fr88vEZZ9YVez5XdsN0W
         W1QpBToJRWU6NrvASrMClQaI2NEbCjX9SYF9kbqv0OckczwGiIW8zBgTcVufD1RJybXd
         WTls8uit4SXvFL/vg71ymIoeb4lx9A4NOqioOGHg9gjapPENGWWbkWNiCeLYDN6pLmPB
         uMhFAhkILFlUxSPsGTrNVq2E+281jkH4L11t/HBFRu980CJSxzBnAUsQtRpg+ebuZjPb
         R0qG8uWScSP8OUrA9SCA3zjAN6M/jV+kz0wSPAFUk6TIZTEnW1ahZlwKYBqoaAojJA2x
         62BQ==
X-Gm-Message-State: AOAM530UakBBdIVqAw4mf39HqUCSZO6Z3vHRgz+dPJlcVy++GRJC6l2m
	D3iTTDOF5yf7bIVykhUN2hFm3tOYX4UPRQ==
X-Google-Smtp-Source: 
 ABdhPJz/dDicQls2Dnf5D093AsPOZ3v/GfeDM5TOIr/M/LU94mUyxj6IvrzQLrSZ4SeJRMfL3fvnUA==
X-Received: by 2002:ac8:5a0c:0:b0:2f2:cfa1:5149 with SMTP id
 n12-20020ac85a0c000000b002f2cfa15149mr4288660qta.593.1650396931644;
        Tue, 19 Apr 2022 12:35:31 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 e16-20020ac85990000000b002f33eb4523asm454085qte.18.2022.04.19.12.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 12:35:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/1] arm-bsp/linux: corstone1000: Handle compatibility
 with different firmware versions
Date: Tue, 19 Apr 2022 15:35:20 -0400
Message-Id: <165039692106.256961.6283786551896721284.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419084105.30820-1-emekcan.aras@arm.com>
References: <20220419084105.30820-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3277

On Tue, 19 Apr 2022 09:41:04 +0100, emekcan.aras@arm.com wrote:
> A kernel patch that fixes FFA version compatibility issues.
> 
> Abdellatif El Khlifi (1):
>   arm-bsp/linux: corstone1000: Handle compatibility with different
>     firmware versions
> 
>  ...e-arm_ffa-Handle-compatibility-with-.patch | 90 +++++++++++++++++++
>  .../linux/linux-arm-platforms.inc             |  1 +
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-UPSTREAM-firmware-arm_ffa-Handle-compatibility-with-.patch

Applied, thanks!

[1/1] arm-bsp/linux: corstone1000: Handle compatibility with different firmware versions
      commit: 99ecf728754efd5dd32f3e669c07209125d41930

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

