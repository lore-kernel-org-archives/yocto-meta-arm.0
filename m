Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11A2C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:39:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.11061.1653406797340226189
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 May 2022 08:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PnFry2Bx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id m13so9001194qtx.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 May 2022 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8eBzGXXaa3ysAmpCmmD97eo0qlml//4POSNcqokQlDk=;
        b=PnFry2BxxBVUaRLkMwqG/BVRTiAdFVQn7CNmpCJx7bM6+Tnm4Na5mZCpMrcVVjwHQL
         93CigX3+MM6Wl3wadHH8fiMujyPEeumLBPgH20pzhCUtyKUyIVByWFegQervEvoZXYhd
         iYLp+xwkaE080ug1+shMsNWFUGp5IseOMXVr9Bcbhu++8yFGP5Unuqe+eYvGsyWz5Ina
         k8FkdTGUAgUKrOizsroxrqMrcELGQIkhd41Cg9oIRbXGyqFomVNukT6tUj7BLz6oQRq2
         xsaqwKjOtNL1za0pZm5eyGYgXdkYtt26t/5fODR++nZEO2LQJD9we5PGVmrOI9pJCZmg
         D+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eBzGXXaa3ysAmpCmmD97eo0qlml//4POSNcqokQlDk=;
        b=YZG4JrUIEej+/3tqDxF+LmwsskZ+Mb14kBQYejzfyIPLpZ4jSdDgfBmn7Rv8DR3tRk
         sWSxwoe1mVuYjU+fLMmYy02sSJ++OS21ZMq87JVYuWJDqhZwWHjgKLWhK5RyiWXuUJ7H
         yHd4J1MsWJaHcOk5/YW16kpaiRcN7jOWosVSDZG0U5J4nemIEJQMZ9EGYjmHblVMq7TH
         qjXG5ZErj9LN+/CWFrxr0DjqfP9cFg93AZWdglVguRFdTDCZAFBKDqLzFuESP0SK5mQB
         1bkcYnkxk6HYK9TkO+fivWEuT06M4sH4bnVB20vpXFnYuPihZK3YJ3WQhz0+NLXur72z
         WNqA==
X-Gm-Message-State: AOAM532v72btxVz5k63yHoz87HvP0DZQ4QIO7X8zvuJU5gMjWW3KXeKo
	6LzA2+H9tFmXI4IIH4iwKc6+92hfhboBCK4H
X-Google-Smtp-Source: 
 ABdhPJxCpit47BvCMBLx5Y+2h+33a9CQYpxk5p37Q3RlfLqXPgygxGq7V18HOxXjd4vTNRVobswwrw==
X-Received: by 2002:a05:622a:174f:b0:2f9:3174:6371 with SMTP id
 l15-20020a05622a174f00b002f931746371mr10484029qtk.377.1653406796300;
        Tue, 24 May 2022 08:39:56 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 cg7-20020a05622a408700b002f9050bb622sm6318668qtb.69.2022.05.24.08.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 08:39:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: make qemuarm-secureboot builds more thorough
Date: Tue, 24 May 2022 11:39:46 -0400
Message-Id: <165340678831.3120189.6310569248057926928.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511152401.10735-1-jon.mason@arm.com>
References: <20220511152401.10735-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 May 2022 15:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3463

On Wed, 11 May 2022 11:24:01 -0400, Jon Mason wrote:
> Build all the things that qemuarm64-secureboot builds, removing those
> that fail to compile (e.g., optee-spdevkit).  Unfortunately, clang
> doesn't work at all.

Applied, thanks!

[1/1] CI: make qemuarm-secureboot builds more thorough
      commit: 0c4c33de09aa921cafcea2ad4b7bc0e19f844213

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

