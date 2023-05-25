Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E128C77B7C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:52:25 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.1810.1684975937185754274
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=KcEHnpG4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75b132ad421so46268185a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975936; x=1687567936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F43kUaAPwTNUQQkGIFQpOuGw3yhQD8ZtNgHSmidguC0=;
        b=KcEHnpG4RzYC5EYQQOdSewryTUL7xyfa6kQkjVDJ9oTGeqCAz+DXldW4e3FYHHcW/9
         N9nPvTuQcYWywKZev0MaHoqN/Oo+YUoTRe6yOlFnepClbUziLm5p6hcvCqOVjmy+JGA+
         mQr9rE8Zr7bsenlph42NDXc54Xpi3jVARyQAFRw/2MZzbnuvaKRGJGPFBgAOL30Y8xyK
         qv5jQC9+0XV7nHrLRvAfI/tuzXYzosWi3zX1+MdY5wcDA59BmcqfCROMyxxyYFeeJJSx
         QrTN/Ycsex5tUZuaiCvULJKfB2qFa0faD02Rfitos77hv+ZO/kWstUQJG73EoF0ZKTwT
         uNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975936; x=1687567936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F43kUaAPwTNUQQkGIFQpOuGw3yhQD8ZtNgHSmidguC0=;
        b=Al1oL6cfpm71e4Z5GW8POZafqkEH6LsBJug4ff4YZTutHk5nUgx1Ajycyw9bjxFEef
         WM9TnBQWXOH1MUAw3A0dTevrIXmt/3vbWX1LBPzK+HiWV03JpbWZ7+Ot13LH6pAPidzp
         /rY2HmAUeLlvRKZFwpNDOZ2ahFd7kRy5BhvcX63n6YyaH/VmiR5IWCAJJLsRmaTA6cl0
         i0BFxvLkC2fZ/vhLUtQSbp0Z5Z3aXbLkGhMo2xjok1rMY+HZzH6ZIOQYUN/n+ZEUcboP
         HL/z8YMYgK5DIVysbz6OCbe20OCjfORSUERKNNxPge+IVfSaxZfYoDkQjUHZAZMtvcAS
         zTRg==
X-Gm-Message-State: AC+VfDziuSwDkA23VQRagIsoDSP6xHrUue3tEqM0cp/q1e0mB+61P0B6
	/n5k/5e1p7b/LQG9jrcOY10QiqTLIt4Dj0vyryw=
X-Google-Smtp-Source: ACHHUZ6Ub0gEJOyrZsRVG3Udr+id9MfMd1S3y2rRWY+7XIQiJYTVphT1R2ISaR3FN3lruL/+r0ZscQ==
X-Received: by 2002:a05:620a:22d5:b0:75b:23a1:35f0 with SMTP id o21-20020a05620a22d500b0075b23a135f0mr8060895qki.1.1684975935961;
        Wed, 24 May 2023 17:52:15 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a15aa00b007339c5114a9sm951qkk.103.2023.05.24.17.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:52:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm/lib/fvp: remove redundant trailing commas
Date: Wed, 24 May 2023 20:51:39 -0400
Message-Id: <168497589903.1985833.13446334660571471321.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524140823.3624031-1-ross.burton@arm.com>
References: <20230524140823.3624031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4700

On Wed, 24 May 2023 15:08:22 +0100, ross.burton@arm.com wrote:
> These were left behind in a refactor.

Applied, thanks!

[1/2] arm/lib/fvp: remove redundant trailing commas
      commit: 6fc35b96138454f2aadd38eaa41a283c756967e6
[2/2] arm-bsp/fvp-base: remove u-boot version pinning
      commit: 87831bf55907fe7f80d0767cd016e4cff3c8b55c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

