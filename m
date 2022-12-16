Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA21CC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:12:54 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.13700.1671199972198527356
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 06:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=YX+6jOXv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.170, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3bf4ade3364so34522587b3.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD2aUmwE+BjwUYZE/TpGgbReZjxiagxvfqS6BxhmHLo=;
        b=YX+6jOXvvxFa5nAzebk9tOm7y/XRb92Q4lOk/PnpvJr1W10z7X11nLNkmmxjSatBFI
         Qrew5kULxePAuntG3QFfVXiVlrjfIJnCzePs7P2BR9W8phaGkM4jY+RqsvE+tSc6Una5
         hP+eaFwnZxh4M7Ph+beOiKnlSmcUOfXlaa7lNps1nqE0gGkQwDWwUA5lcxuae3gtNpib
         YZX9r7g5sHnG8F244LnkBCN7lOFtFnmx1fzK/95jjkEPUvcRT20iGGVmpQPaVjrhUioD
         pcBIbJMtT69GUrTBXp2P+pJLdcPqdpTVHRANrBVSNjRix4OXLw7jUxWtR+UjjKUN2ODO
         T0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD2aUmwE+BjwUYZE/TpGgbReZjxiagxvfqS6BxhmHLo=;
        b=CSDaZXzdyYPmNPdLUcdwjfrp9Bpcq9KAXBOAUiqLieL1S1WoHys6H5EFXBtg36vKU2
         6sj2+t86/IdFUcEQxehtdunvxaPLHy9gov1mKXGK82oT2U9Qg/JK2BfW7XwsmFNJv8uA
         7rZ3iDa4vYauLkS3jdAPTFHtC5HJCgxtLsjB2TVD3mu3YZkV5BP80tQgZgeUsHYjibzc
         QIXc6wepBFA3kdJfHoNCOfHmA1rgqWorVveb6pOATE0pDmgY9jKvkt/6v1BXs7hCm52E
         XNg0SZx1+54iC3zUK3h4Zo0ErgyI2NYKckwCzSmuoA1uI2zQ/pdLZYzV2hRa2jrAfSBO
         2Vvw==
X-Gm-Message-State: ANoB5pnBK0X7kpInXorEdWHJfTQLQcC3i+eCiQb2KtF7vfRTGmvEEyfk
	HPEIw1G1TUXn1EeaFillApEiAZldDeXkhaUX
X-Google-Smtp-Source: AA0mqf68AlaZgwC2irdQEYREEPbM0fhdJlEexdOK/FaxBMqDRS8+0CW9Z9UoaZTiRNnwrcKliHn4iQ==
X-Received: by 2002:a05:7500:2b8a:b0:ec:9247:dd67 with SMTP id dr10-20020a0575002b8a00b000ec9247dd67mr2509136gab.61.1671199970644;
        Fri, 16 Dec 2022 06:12:50 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id v18-20020a05620a0f1200b006cf38fd659asm1558390qkl.103.2022.12.16.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:12:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-m: update to 1.6.1
Date: Fri, 16 Dec 2022 09:12:45 -0500
Message-Id: <167119996616.2686849.1284576663217184887.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221214180332.3429-1-jon.mason@arm.com>
References: <20221214180332.3429-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 14:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4198

On Wed, 14 Dec 2022 13:03:32 -0500, Jon Mason wrote:
> Update tf-m to the latest stable version and update the mbedtls git tree
> to the new location.

Applied, thanks!

[1/1] arm/trusted-firmware-m: update to 1.6.1
      commit: 1ba7d646da5aafb47f81acb04ba968193231c869

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

