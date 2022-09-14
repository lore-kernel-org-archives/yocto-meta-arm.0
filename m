Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F9C6FA90
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:09:54 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.6724.1663164591694322610
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=veytpAaJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id a20so8560876qtw.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=S4xVLF3wHtYghAGvcYV+QrLbbVvXop2sPhdWsJBtlsw=;
        b=veytpAaJ6FyXw6WHM73uczxk+ODwPB5qknispkLTU84yiCE1hfJz92hJuMMcTxwr8i
         KClUnCpxB4xh/VBxSAu82953qv28M4+4QxOZvu02hIrSSP2IRhZ34i3QhM3ZO2rbhAon
         Z1FFcJx9VdXP9mynbB0a1tKqgoRdSUtWQgnrc4WnPoo8BaH2SNIrLwzBtuKJFDeEKXvl
         P1hvTbvFGll2K40+l5ZK6LWQCfIzXY0iC2Eccb6IcKPin7jIiXf+lldh1nYm27H06B0e
         +uAJSAqzLmSssyNs0i7w4H281rz+uvqHc7BwdMNsu+GYw/oq9cCvZ0Y8KRIrGgXdU9Xl
         blDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=S4xVLF3wHtYghAGvcYV+QrLbbVvXop2sPhdWsJBtlsw=;
        b=0CbG+ar2NKU8UTXaM9cEAIkeIiVyBFtels2SoSXijmkyg7VbgmIN8pEGxcBJ0T8jcy
         tNsyWbH/bVlZV+WOoWYOuD6wLujpiaIuKpPayqjLvJWIVfI9J4MmHw/8xeUeBpS9GOE1
         w7JFtDuYUWOVT/i4Ma0s6FK/i2QsfmwUY6HUKGfDkkZ20nqjGpdT3D913wlsU8Eb0Js2
         AW06STy5/rdYvCfj6U+s81+h91+hMpin2JUh6lVsAI8jbkHQ0mS4lRyDUtQ3JAIGDHPs
         v3yzSsKrN9C12z6BUzqb3dINXgxalpgpV0BjMxvwN4Doiec6iJwTxpUsBJ57LAjrksZZ
         pmAQ==
X-Gm-Message-State: ACgBeo28PJc8whxg912BFRc1l8V+bcBKo0IfrsVJAzhM64keSYRAlLbU
	wPTV4OHhnhF61SXJg5ih4CF/CaihzPfhPw==
X-Google-Smtp-Source: 
 AA6agR77mROgKN4tvxUR8QXV9YZsXFGWJdV1lbivUF7s7WGsJNYlwLImRg4DO6I0a4bpnrUMSPl5UA==
X-Received: by 2002:a05:622a:1456:b0:35c:b7b5:3ea7 with SMTP id
 v22-20020a05622a145600b0035cb7b53ea7mr5071512qtx.70.1663164590432;
        Wed, 14 Sep 2022 07:09:50 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u7-20020a05622a17c700b00342b7e4241fsm1566176qtk.77.2022.09.14.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:09:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Joe Slater <joe.slater@windriver.com>
Cc: randy.macleod@windriver.com
Subject: Re: [PATCH 1/1] arm/packagegroup-ts-tests: fix parse error
Date: Wed, 14 Sep 2022 10:09:29 -0400
Message-Id: <166316457281.1963578.8079127306930239993.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912172217.1703643-1-joe.slater@windriver.com>
References: <20220912172217.1703643-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:09:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3780

On Mon, 12 Sep 2022 10:22:17 -0700, Joe Slater wrote:
> PACKAGE_ARCH must be set before inheriting packagegroup.

Applied, thanks!

[1/1] arm/packagegroup-ts-tests: fix parse error
      commit: 7c3e597b4c61602400a938ab701b0dbed9c9e009

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

