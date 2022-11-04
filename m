Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D154C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:50:51 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.11980.1667573448194532638
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 07:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=bdestC2s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id mi9so3328846qvb.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSO7EeCnnCo58Q102roFgt1x6g2rL8PVbzTB27t/plc=;
        b=bdestC2seTXCImQ+q/df6SsBJaGYNeNRgmLpqqcHPn5Ovs1v8dJrYpx9gdbZHGYQJU
         3HR9Cf1+Yl+6PeQ+5VXfPshaDPCYuc7FBDZDipH8Ue8MDH4dQRROYWDI0Lj+EQ7gbGGK
         8ivdrzJnrl4wRD+O2DLXmUCrqndf3w394ps7DLc1bmoJG7evNs1m2aGb6O2quhJH02f3
         tb0zviiw92Fx0ZR7p4tMqguEqC62t4Lsx8H222WVkXzgXYAL3cHlLjv5ENm87zj/Y0mb
         UB622gACb6R+Tn6IwY8Gp5PNTLOnGrGrdH1GG9qfwZKH3Qv4DpEqb2+f8KG2T7T4+OG0
         zTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSO7EeCnnCo58Q102roFgt1x6g2rL8PVbzTB27t/plc=;
        b=DAvdTk/QSs3ta29fbcCbZ1HOvNUpuhYyJKVJwsg6dGY10xo8ZhR9KeJGAXIf6VwdMG
         NnoDvzdnEN0a3SaoedH66LbU5anG07D3C4W40AhhBtIEHFHfjhyQKyNwOHdDORC5G/AY
         ZgtUy59HNvxXlR4alhWjAuI319p/XyvmNak8p5ECP5nR3tSmgsFMVoNJr8aznEljPZt1
         AIIzFVTkR46bWUICjjTJl6tJKNjrVJn/rUEwzn8dOekCMENE4tSqf9m8whBQli28yufr
         2CuiqIS3Xy57GhbsB+RXWz87NzA3R36UlKX4JZjfMlLTq9nVpEodb05Z3e2SHooVIeet
         ZZjA==
X-Gm-Message-State: ACrzQf3o/7fvfC5okJjDKE5kkobG6tIA+3spGP7kkG2JD+wYwMlIDuDX
	apZr7k9vLykFhAqSMuOp8PhTe4GLQvcbZw==
X-Google-Smtp-Source: AMsMyM6Kkw6gyZfMLw1PJez1ybAmbej2qH4YCtkw3gFJQ2j02BQTnxxz54+paabB4TIh8QA+jSgd+g==
X-Received: by 2002:a0c:e3d3:0:b0:4bb:c033:76fc with SMTP id e19-20020a0ce3d3000000b004bbc03376fcmr30656245qvl.117.1667573446870;
        Fri, 04 Nov 2022 07:50:46 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id k16-20020a05620a139000b006aedb35d8a1sm2975325qki.74.2022.11.04.07.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:50:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Vishnu.Banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 1/1] kas: corstone1000: set branches to langdale
Date: Fri,  4 Nov 2022 10:46:46 -0400
Message-Id: <166757320672.2581019.17478393482835706495.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221103160808.25570-1-abdellatif.elkhlifi@arm.com>
References: <20221103160808.25570-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 14:50:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4075

On Thu, 3 Nov 2022 16:08:08 +0000, abdellatif.elkhlifi@arm.com wrote:
> point poky/meta-openembedded to langdale

Applied, thanks!

[1/1] kas: corstone1000: set branches to langdale
      commit: 46e8092b6b780525b78e42ed01e75cfa25a58028

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

