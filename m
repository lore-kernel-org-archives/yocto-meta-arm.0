Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C33AC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:24:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.15541.1638555897338990470
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 10:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vPs6bq+d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id 132so4316078qkj.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k7kAl3HvR7nqzW6OyQwvb5iWTVDS1QIG8L7vTmjzb2k=;
        b=vPs6bq+daROk9gseBMVXQP2pWvc8U0ktBitFKExFZuqQiRCRKSDJNNtbihQaYd0JEt
         g4oiOYaeobh7Om2TtK8y0h5EnJipJhvE4UQIWULfoVz9sHwWjY0mOuX+jFWl1yeEL97X
         C0r+ohD2UCjFe7xnyxn14VQKzfqtxjPTV3CVjiYe7t1nwC5vX2W83+3O4/6DM0gr79/w
         lZSIfEC/fD7YIeqq2VtokGR/9YRyfBRAuQJp12/Ano4uAgsd8vNMxX3f1q2Gf/BLuEl7
         bUm/hUBMxQZbsOeKPKBwkXQmnXtMfCoiD9Rhyzxc7yF3+S6CAP7ENVI17gZ4P6xu1PD7
         afOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7kAl3HvR7nqzW6OyQwvb5iWTVDS1QIG8L7vTmjzb2k=;
        b=Mpj6qQ9eher/o/CWEkKOjfRT9TkX/ZQDIKvBAgWbj283OYnV0eBJQ/MbRFhX2P4a5X
         cP2TxEBYdMPf0Uajr+dPuD1xCX9ixUIa3JRnZmQAleqLzkSZ1biVOr1+m1Doxv7v7mg6
         VsoHLQnw3A9R+P8nkpuJ34Y1Qnj9B34G0WMIqCuJz51iXq1VHhyasyPZQD+QNMWUNZ0z
         LpanKXYXoUnMx8jbahJ5lcbWrJBiJoypj6y2H25gD22VQq8LHlgsmCkSqa+TV+DlWMYj
         Z9DViiCHShNQ4738SzGPnbWEC5w3IYjYRnHzYX6iCd9fCxLz7alyKhPfujUY3ck9vTVc
         oBKQ==
X-Gm-Message-State: AOAM5334P6+zuwbQQACGY/Ot1dvMcHlDNmWpxitoJXrXhfEq9FlvF4FB
	r6sfzEYpCvkBWcTCcr9tDQO1QQKvIiP/hg==
X-Google-Smtp-Source: 
 ABdhPJwDzQ3XNPocJbc97PkRxgltSmmjuc9D0iYByUmiYZsG+5Q1v4p2jC6TB4fQmYq+Uzu5rMmYqA==
X-Received: by 2002:a05:620a:d96:: with SMTP id
 q22mr19308422qkl.219.1638555896276;
        Fri, 03 Dec 2021 10:24:56 -0800 (PST)
Received: from localhost ([2605:a601:a605:bc00:8de3:48b3:591e:85a9])
        by smtp.gmail.com with ESMTPSA id
 o9sm2941807qtk.81.2021.12.03.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:24:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH v2 1/3] arm/edk2-firmware: correctly set the target prefix
 in Clang builds
Date: Fri,  3 Dec 2021 13:24:53 -0500
Message-Id: <163855553106.21208.14160664144164766092.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211203132607.2648640-1-ross.burton@arm.com>
References: <20211203132607.2648640-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 18:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2531

On Fri, 3 Dec 2021 13:26:05 +0000, Ross Burton wrote:
> We set GCC5_AARCH64_PREFIX so the tools are prefixed correctly in GCC
> builds, but didn't set CLANG38_AARCH64_PREFIX. This meant the clang build
> used the host objcopy, which may not know about the target architecture.
> 
> Also these can just be the prefix and not a full path, as the binaries
> are on $PATH.
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-firmware: correctly set the target prefix in Clang builds
      commit: fb9232c4e16c96808bf69579098063b0a900066a
[2/3] arm/edk2-firmware: force debug builds when using Clang
      commit: a0296bf8a0966585db72a8c6dd5fdc67ecf8e088
[3/3] CI: also build qemu-generic-arm64 for clang
      commit: e329253758bc0f9ad4be3c78810e5d3ab0f01e2b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

