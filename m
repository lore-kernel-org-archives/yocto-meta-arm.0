Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2EDC433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:40 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.19061.1648953571441627208
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 02 Apr 2022 19:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kM6saJ+8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id k125so5173413qkf.0
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 02 Apr 2022 19:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mhYxe2XQgatnlqx3gSnFaQypMBJdjRHCJn1UMXtPoUk=;
        b=kM6saJ+8YdjdD3m8mHtRPwToKr4oNPO6gTlg2VxgyJvEZ8QMWx4QSrns7qgNz/sfe2
         r0Vdvx5YxqfwH3mbOcd7x4OwegvaoqFXO5w7bl/v/vPTfZxBDso+IZ1+x9u3LRzRhxG0
         rZh1O2x2152wHtIKTb7jm2hv5JYBBnd+F+vIrnPi9IGHd6EYa2FqcgBVXmBoELjRze8O
         VqNnhXfRCzDHTK8Z530RWf/41Zt8PnlCly61G+LUOJbhS9sAVy/Y8aUZL4da2D4mAx49
         CBBseGpcJw447NHobamb0Lnu6r6usnzC9lrwFGyowhY/zkZQkoHWxEE0JYRd8l4YV4X5
         2WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mhYxe2XQgatnlqx3gSnFaQypMBJdjRHCJn1UMXtPoUk=;
        b=Tdxa1mEXzZe2si3eITgcs+ZAYy3CxcH9KroTOGQfDLKwGWH1fM4RSly+wfw5h+CVBm
         Q2ICyZMJttycO0kyN1YCXCS3nE/PkRdoCCYuwgYr4H0DIGzqeH1+OiA2QkQ0V3EGviZo
         xWsovjVkVZv1P/DTp0T8GwFOml49AdN9OclCkY/nazdnq4q7vKy2S3GAM/SI/OpaFRHu
         2nIwtmvhyN/439OELdMBscOALW5dTyuRUMRH/CNdf8hdRtiKAIzj9iHrIShIsSL0pH3Z
         GPtTKI8Drrl6jZI0Ocd/Xzr93WcXY520VonhYnT1du8HiL3FxNzsLnF4FJSNcv++pMmP
         UiBA==
X-Gm-Message-State: AOAM531QkHH8SOuIKw/ELRO2z7YE3YTe0reyijH8PolwqVJEU+rX1K+8
	dVHAtzvPw1aVsQacszUYnldt+P1QC3rL8Q==
X-Google-Smtp-Source: 
 ABdhPJz3slz8ord90+MUt7q5JyUbTDuRrzsehtEA+tUvpy6E6rXQZxgq82NkhnTAQcRY7ytqMJLLqA==
X-Received: by 2002:a37:a3d1:0:b0:67e:81c3:5073 with SMTP id
 m200-20020a37a3d1000000b0067e81c35073mr10094110qke.294.1648953570466;
        Sat, 02 Apr 2022 19:39:30 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a05622a105200b002e1eb06ece3sm5127720qte.31.2022.04.02.19.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 19:39:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 0/4] arm-bsp/corstone500: add kas, runfvp and wks
Date: Sat,  2 Apr 2022 22:39:04 -0400
Message-Id: <164895354471.3053578.2197432469277784352.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220401144128.3517236-1-rui.silva@linaro.org>
References: <20220401144128.3517236-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3233

On Fri, 1 Apr 2022 15:41:24 +0100, Rui Miguel Silva wrote:
> Now that we have wic_nopt and ci noop for testimage classes,
> we can add wks and kas/ci configurations for corstone500.
> 
> Also add the FVP settings to use the runfvp script and
> infrastucture and update the documentation to build (with
> kas), and run (with runfvp)
> 
> [...]

Applied, thanks!

[1/4] arm-bsp/corstone500: add image and container file
      commit: 3e3f989ab5a67c5a9d3a2770c80d27124e1f9250
[2/4] arm-bsp/corstone500: add wks container for image
      commit: 7b3ce21458491338fa78cb83a6890d6364a696e4
[3/4] kas/ci: add corstone500 platform
      commit: 575d502cc84189ef164d1b6d615bad278467f5d3
[4/4] arm-bsp/corstone500/docs: update for kas and runfvp
      commit: d5406cec2ea53aa62008f86bf586948983ed1394

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

