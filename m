Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E7DCCF9FE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:41:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2110.1693964505480617918
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 18:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=X1juqjOq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-64a70194fbeso19143146d6.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 05 Sep 2023 18:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693964504; x=1694569304; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhOWw3R0fzjnjiEYzSl28jZlh1HHln81kdLqgZqwKUw=;
        b=X1juqjOqC6sImjc4Y3mg804gTSQt54jRXLud5KXg1nFUwIUMoBuXaAccCjcF6oeaHW
         nh8Ey0FDp/zBUp8gRKLy+2u223JwuziI9JCMDUUabQ+rZg6uil1vvnzikDoZnudAIa7o
         2YRdCQrG1gRFFsy7bxpKGlS88XJ/dh5BWzxSGz52ufKBRh5mXjgLGaMm5KXRq/B2QTDI
         UCVFs+YGAkXFby+w3eSi/Hm2JzU58n7eeL2MapVDMqlVgf7hnL1oU6BNj/JT2URtsue1
         0G9Q9f9YmNaxSQ7Zp1Lb0tSR3pVc1iXRUtO3/n+AoH2bw2z9Nxu+7UEBbZOik6clSfj/
         r8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693964504; x=1694569304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhOWw3R0fzjnjiEYzSl28jZlh1HHln81kdLqgZqwKUw=;
        b=gW2rCRmiuY/z/1+IcqT8HgP2Hkpc8soH6Jc3oJlKUOSg4ddxfdUlJQDqtQ+ZJEB8Nw
         N+44fE97bDwc7GRXqqFJm232gMyeJ57zSaiNLGzCGTfSu2XvVW5iQfc1fFaStUL7aqMg
         aPdrlOVr7bLpQd5Vjw9X4yUYom/cDibxaL/5OF0GnoC0EJqj9aAucQcZGsJ4VHCEeCc4
         9P/+i2h6vrIu/8tAsGandcNIUp93CEbLm1gKP878QD3dOF3K6tLdde6LUfhIs/s2fQxS
         eHMdzijt60nFBdzZYsnukruWDFer5SyX3S/wL6IKh+brHFoNr6rDGtZmhcuc6XsrhJ5j
         uW7Q==
X-Gm-Message-State: AOJu0Yw+79Y5PTk4/tt9mtzFUn5218lW/JAduC0rUb3V6GtXA2QvkkqS
	Tiw4yoKL8gTpLlN/7eubYhRbQTXLVBiOfaoXnak=
X-Google-Smtp-Source: AGHT+IG0PZwzwlTUGIKt541DszwPPPDWZRURvCEtkdT52SeGRs+H/xR39Xsuukmn/Fibf9vUFaGdtw==
X-Received: by 2002:a0c:f50b:0:b0:64f:3c26:fec3 with SMTP id j11-20020a0cf50b000000b0064f3c26fec3mr16051836qvm.1.1693964504131;
        Tue, 05 Sep 2023 18:41:44 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id v8-20020a0ce1c8000000b006301d31e315sm4991498qvl.10.2023.09.05.18.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 18:41:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	delane.brandy@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: mmc2-enablement
Date: Tue,  5 Sep 2023 21:41:19 -0400
Message-Id: <169396448143.362418.13050982179879591628.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230904095615.516245-1-delane.brandy@arm.com>
References: <20230904095615.516245-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Sep 2023 01:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5021


On Mon, 04 Sep 2023 10:56:14 +0100, delane.brandy@arm.com wrote:
> From: Delane Brandy <delane.brandy@arm.com>
> 
> Enables the support of a second mmc card, which enables distro installation.
> 
> Delane Brandy (1):
>   arm-bsp/corstone1000: mmc2-enablement
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: mmc2-enablement
      commit: 99a23c40ef1bc785f3d7a9ab0ab3a6271e555e94

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

