Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B512FA3743
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 21:38:50 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.3148.1666906723172398948
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 14:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=6nwQJ/mm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id 8so2177720qka.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC8q5Yrf6B4T/MQ9eUfbLZaQf7+/cKBFW4w7qAW7RMk=;
        b=6nwQJ/mmFEb9CQv4Yt24xVMbPCcDQ8uDUZp8d5PLJf0uW32mBeMler/78GgMgIxTsS
         7zZHp25fn4sR62pSc8t21AN0BUUundCP1MT/LOqS8i1vbsV+aQ9JWgnZS1hrz9dk7G+L
         WMceZ+FNixz+MfmtClSYsI724dMXEvr4fzc0Gar9UJ9ExnqWAN7X63T+ohKE//ivNleM
         w8x8QUqrVw9krTw8UMb0oXz52as0nOgOEUq3LwfptXSQIBCM4MofoWHuxXm5ahHiZZLF
         PoWZvppZLqsEZj6bE4cJWO1ojC1+6o9mhWW26yRHRLHQNTulWuchvGXgyI/wLv7Jvn6C
         mzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC8q5Yrf6B4T/MQ9eUfbLZaQf7+/cKBFW4w7qAW7RMk=;
        b=IeRGK9imNthW4o4R1dbPKO+nimbudmoCPzVxtdfYQXUTAm/JTxL+a1/Wd4+h3qRsWZ
         LGgxQ250u55cn6xaVaWmLX6EU2yaA3XSsP07tQPEzYRh+zaYYhS14+/6foZaIkTzzqri
         SlFkOWKizABYzQisR70np6ri2JoiwQ4BVu44kCRNU4mhv3hkfBrx/JemkqZxKzmovcVu
         sGUnN/wJ7VCAhR3zM/NMf5LLtAckLpUKoXOHgxN8g5XTPHO0fQP3lJWUuyhxDuSKgP5J
         RLQ6x7GgPTxEEzZAC1wjyFFgpBiqh+Bicm4+VbxcYUS7GL4LZFL+whnlDd6kJeAAlioW
         z96Q==
X-Gm-Message-State: ACrzQf0wWpBwiw7negiGjrc+3Lx7ppTkzB4kbkrcDWWblA2xr9SdJh52
	dnmFKdJjZ8HmMJUzMH3GjKy6yrUqBiA4eg==
X-Google-Smtp-Source: AMsMyM67tF/sBdVOAxmSBV5aPzIDDtGNGVSdv31WV1pZWqucqZJcE5DoaXFN42CKaTRXQHT1Q1xf9A==
X-Received: by 2002:a05:620a:800e:b0:6ee:b25a:255b with SMTP id ee14-20020a05620a800e00b006eeb25a255bmr36495293qkb.226.1666906721911;
        Thu, 27 Oct 2022 14:38:41 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id o17-20020a05622a009100b00393c2067ca6sm1480992qtw.16.2022.10.27.14.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 14:38:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm: add Mickledore to layer compat string
Date: Thu, 27 Oct 2022 17:38:37 -0400
Message-Id: <166690671826.1783399.1367511806530430792.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027135341.20393-1-jon.mason@arm.com>
References: <20221027135341.20393-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 21:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4055

On Thu, 27 Oct 2022 09:53:41 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm: add Mickledore to layer compat string
      commit: 8d7f3c03ef7079ef83e6d81c2e32600f5730b63a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

