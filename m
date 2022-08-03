Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01D1C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:32:13 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.8523.1659533529860922409
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=LvdX1JoI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id q3so12891888qvp.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=LvdX1JoIyB2M5aSHfYWpQN6JE2LecUeogyxXebYaCybRG96j2c/byPlxkeuHoV7sES
         fHFKqpFhzgMg2ItbcStORcHUZ5/rIwP/E8izf3uvtzwaPlT1Xkz0PJ0gt7OXxPiOq1yP
         IKZgMiOfXjfuf4EZsSiUd8QodJxHcGXzjmaLOfwd3YBCoJ+Onte4EQ2/Uorq0SACk13Z
         Z6IHfJeZcTdZy8tVVFwa+l+P+YHI0atW8n/kt84Z1w8QckdzhNjCAc4kS/9B1PxXodT0
         xyt+bJUC2bybqq2r4Dw2M95niaVeWMF4fhMY/QRHxmZPgTfnHtSWh7FdoDbLmxZShjoe
         ge0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=6Ixc42ZS6PLWwrriGIf0P2NOGTpKTJHuqiSlzSFFD0OTSbjyQdOtRb/9+oFaQXH8ch
         F7EXobBCTxNTrPLWYaa2ZRi7MRjsY5AvbJYYprbJ05Va8fwJPIAU6BklPFeMEfVaVP0I
         SzMvTP4rT5tX0VGY1gQA/PGj8ay8QBDoUisY6xo59Dkz9JSrKuL/auRPTcY4n9sFxIWS
         bV64amXTOjJxkAUQCYH+QbZw82oI+JfYfQi7pKhh4Up/zI94hrC1JfSfpsGLYSMRMB/T
         gorE+UqLTB64q9Wne5WtZFw4zkRm7jvcbk/LY3l1l5g3k+/NWjJ1c8r9BBaFhwhdr1hl
         mc+w==
X-Gm-Message-State: ACgBeo3E+EkZfpL3RT4pIJD/2wQyToiTTBVw8XQZYofmVHG3mQZimm+f
	hEQo8fSE4uK52E2s069PEB+Gj+WFY+JScg==
X-Google-Smtp-Source: 
 AA6agR7HmFqTpvLOF4d4LZKmHb6xpehtB0Xu7wGl+ZzYoCT0AAQ5Y5dCFYzEHo9STfM2XtDEU5nAVA==
X-Received: by 2002:a05:6214:3017:b0:476:7430:64a6 with SMTP id
 ke23-20020a056214301700b00476743064a6mr14079013qvb.98.1659533528364;
        Wed, 03 Aug 2022 06:32:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a37f712000000b006b5df4d2c81sm12071804qkj.94.2022.08.03.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 06:32:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"changqing.li@windriver.com" <changqing.li@windriver.com>
Subject: Re: [master][kirkstone][meta-arm][PATCH] optee-os.inc: support
 multilib
Date: Wed,  3 Aug 2022 09:32:01 -0400
Message-Id: <165953352140.321388.14268598841378896518.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802062819.4061434-1-changqing.li@windriver.com>
References: <20220802062819.4061434-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Aug 2022 13:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3638

On Tue, 2 Aug 2022 14:28:19 +0800, changqing.li@windriver.com wrote:
> Run command: bitbake optee-os && bitbake lib32-optee-os
> bitbake lib32-optee-os will fail with following error since
> bitbake optee-os already deploy same file under the path.
> RROR: lib32-optee-os-3.12.0+gitAUTOINC+3d47a131bc-r0 do_deploy: The recipe lib32-optee-os is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>   /build/tmp-glibc/deploy/images/qemuarm64/optee/tee.elf
>     (matched in manifest-qemuarm64-optee-os.deploy)
> 
> [...]

Applied, thanks!

[1/1] optee-os.inc: support multilib
      commit: 844696e401bca5df7a06092c059d03ea71df9990

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

