Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65957C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 19:13:34 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1556.1652210006568786215
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 12:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=jFA0tfqp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id a76so64034qkg.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59Kc9cTI8bp1sBUNMa0Lh/gbthIlWD5xJsE/d/VOfpw=;
        b=jFA0tfqpfhktKZA85b4UbEXqpgB4Hpj8whZcYUNnLqzejfyGypuIb+oDq6zh5LFv70
         80xMiHqX2RBfO8K5izf7hwWEtMfDkw+YYxQn3bIHVsXENhQ0x9e1ISGXQOnS/BhZEleN
         McW4vCVFOX87mg90XyoprKA5JXbgh8jfz2b0BJe62PcIBR6Q4ZYSEEVgEBflRfObd2yW
         lRi6p3qouWaxRyv9DRmrSCVs10U9JtRj3K9tkmysR+mPterrWk7Na5vqnN3Ja15jwhsC
         0Nou9TBsvx4EBosEdCtsbRkGk9pSeIxS12aYbJFQABA17Ie9BsvJWUKvBs5LU2VZgNhp
         jgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59Kc9cTI8bp1sBUNMa0Lh/gbthIlWD5xJsE/d/VOfpw=;
        b=dNq3r4ECZOb4yvwdNWyXQXoxIWV34+uBopHYYLag+iG/B0tpSAJJfzkugAlOWGpKg8
         /25R6RRkznO4unlj+gVDYICy63xJb/q5O1gqNDEQ4gdkx0kcQaV9If8SorslUBhiHpGq
         cKzYcP9+XhwK08dWmgVrnqKHg7TUl9xx0u0jIqSslJ1QQ+LTh+b9YMYn4UJBxs9GQ2eR
         Rxq4TV4V2du6vVsuH1+AGjltDhBv1nVYec/8x87N+KYM78W3PP8xNL+L/j9FyM4xbNfh
         70RcvuLtuiVLGJAtosON8HGDtMdMuyKpqpo+fNVaa+t+gmGuxdXxVmjT6bVjS0jm0tw7
         dVhg==
X-Gm-Message-State: AOAM533USIWYB57lZm0p7S1cecotronpWtMR5cDqBMw6EmEn1ldcC6Qr
	U4wsM/57JkpRftn/hJZMA2XZg+7hHIlmgKs5
X-Google-Smtp-Source: 
 ABdhPJxuQ/BdSc8BRoc7vEWUwL7N7waPI5KBAZscW6VhgsFRFoi0LmflKiqB+5UqpZRalSzheG5F8A==
X-Received: by 2002:a05:620a:4503:b0:6a0:1a0e:244a with SMTP id
 t3-20020a05620a450300b006a01a0e244amr16372419qkp.321.1652210005536;
        Tue, 10 May 2022 12:13:25 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 h132-20020a379e8a000000b006a059f1d8b8sm5726171qke.124.2022.05.10.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 12:13:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Date: Tue, 10 May 2022 15:13:20 -0400
Message-Id: <165221000040.1371498.9963809542908312232.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510101508.2785347-1-ross.burton@arm.com>
References: <20220510101508.2785347-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 19:13:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3378

On Tue, 10 May 2022 11:15:08 +0100, Ross Burton wrote:
> These branches have kirkstone branches now, so use them.

Applied, thanks!

[1/1] CI: use kirkstone branches for meta-clang and meta-virtualization
      commit: b838d40efe06c839d58cf39b785175d0ba7518c6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

