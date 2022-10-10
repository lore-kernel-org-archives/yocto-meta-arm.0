Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE23C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:02:35 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.7132.1665414154820390948
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lDxqUogE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id l28so1098358qtv.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laE+cZItnry6dEudZxY5Xj0EB366lY8w4OQdv/IzKtI=;
        b=lDxqUogElwg6jIqi1p1pSwRDgCoFgN/IY8Po8XNvwjL5s+lUTbWXcCWWwBIuf+/aoS
         hvbk3BMfUhUC2JC0fZWpXVhyvBizOcKHs5Ewk1zmXvP4mLuKu7NwqwrvHAGKhe4uxc+a
         QNDHH/ggGbIrIXny6TTIo4HTMcUUfYbVN/mD8PSuaCSfRprMPqGfeaeetGLR4cxkidGP
         oWsRhNLn1ejQtwUKQXqnvFa3hqqPly1UFnjEKcmy6ZzCVlpwNyPFVQlSdAwrp3p0uKyN
         sRY62MZUqDDcHNwhLx1boQTFUC1J9WfXmzQJisQf3xSxS9qyqFwrIEXaSo0sX8j1DPyA
         huZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laE+cZItnry6dEudZxY5Xj0EB366lY8w4OQdv/IzKtI=;
        b=mDryBhspYocOAvnwMCYyVvnqCn3K1bMlUNCBWfD/dFlMUDeRZfN6V1u9Kq5gsfEJw8
         uzXniqnV9BsyujM9gQdS1LFVJBf6KKTAwB5NU6UN8/HiszdeHBKd85Rcy4nVDPr8ja8N
         Meh7wKZollXKr431rsXY3/ApAYQ1DNLdSK7f2KnMZ+F9Xp3GTPpLhPaR9Uii81hWDvPY
         IxFnlqMAn1QSiteV+EymyAKLd7RaTKzqj2lJM4VtJ2f/o22Q6OcKZxCA9Qs/WOi7hmI+
         jgQes0cvkHSySHww9p3JWZdOxxbW2mdzRe4Iz5dNSnHbm6KzY0v01lcta5AKt6pOaDy0
         84hA==
X-Gm-Message-State: ACrzQf2r+18MzXO+LgGreOzypll/1AIL5V1upjKNESj8bodsByzbRvPb
	W01xvXTTDYEywLG+8FgzGdEnO/arEfcsmQ==
X-Google-Smtp-Source: 
 AMsMyM6go1MRKpXEsA0c01tri3qUXIXLQKlj4Eu6iE8Cj39E9wSGa0KaAvDubh6Z/tOruInq4pW7xQ==
X-Received: by 2002:a05:622a:4a06:b0:393:9a99:a0b9 with SMTP id
 fv6-20020a05622a4a0600b003939a99a0b9mr14994003qtb.665.1665414142257;
        Mon, 10 Oct 2022 08:02:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bj30-20020a05620a191e00b006c73c3d288esm10076558qkb.131.2022.10.10.08.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 08:02:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: zephyr removal
Date: Mon, 10 Oct 2022 11:01:59 -0400
Message-Id: <166541412008.1841493.7269102543012733008.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221007150935.17721-1-jon.mason@arm.com>
References: <20221007150935.17721-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:02:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3946

On Fri, 7 Oct 2022 11:09:35 -0400, Jon Mason wrote:
> Since meta-zephyr is doing CI, there is no need to replicate that here.
> Remove all of the zephyr references.

Applied, thanks!

[1/1] arm-bsp: zephyr removal
      commit: 545ba524b8362fc3a4320342f36df038a827a202

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

