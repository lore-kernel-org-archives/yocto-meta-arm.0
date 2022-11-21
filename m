Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 986FAC43217
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 20:06:34 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.720.1669061187058826506
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 12:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=s62/+wRB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id z1so8825274qkl.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osn9s/bky1RK9md1F9NPlRbdgbY/PsTKVxQ9EJ8ftKc=;
        b=s62/+wRBKHL8CJqwZyQAs1+kGTgJ3/bjVJmFomNsjcKH8ezOACxefZodMDUoqvUB8B
         a823uUFJTrRt+qCjdewlqMXg2C3MW5tOD2qg4EU008iJOIVOut0F++r37cY9gArs6w15
         4TlCwYRF59QPEqvl+JVXVeAGcQFjb9/LNxZh4CPeyMXcuILGXHQdu/i5bYoJxfkQpc1S
         C6j9wl86WoNKwtsDhZD7wnBKbBLDtM+QaYjHLieGJroI7lCQrBTVWlRSKhG11iblr0O/
         1AopRVBPCxAmFRL1U+0hApsaZPE0m00T8F8W2r2OzyM3LfqNOQ8JLeLLkpvSf666Kuei
         /orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osn9s/bky1RK9md1F9NPlRbdgbY/PsTKVxQ9EJ8ftKc=;
        b=bUYT5TYjuHA5VpGcR8J1qPopBq2vCI0hr5um+zzjDYGyer+lusklwVZfZb82nDHxsp
         jpAUEN3hL9p6pySUieKnYnL0OnitHhu2YH4XVGPeyMR/lnx4QPXYcZOHG5vmC0tAyt0K
         BeAI0YSNwux3IRQVzhnpNuuikelicGWgZZBbwExyOLejcnvll93OjR7hqy1JlbLZLTgL
         IXMq+1U5exBDSxG7kS2h/DDTpwlwN2q8YZGNxGEczcfKOy8Ej0H7qAZSLTjj2zFhbG8I
         BTF3nMj8Xgiuw9RVGUyK+e8CM6P1n2JpNXYnoi3KpZ/OYW/ikt5SY6ReYoOxEIqxs09Q
         PsrQ==
X-Gm-Message-State: ANoB5pkDH0pZPhNEw7hBwNwJ1/FQpzsTY2sJXoTxNdIjZOdWPN8wmYBM
	T5nBqIKactOaZvI2lWKctqkrzpeqYEcZyA==
X-Google-Smtp-Source: AA0mqf4+lYi8Y+zF8QaE0xH54wuDYhGUMQ6i/UztFxzYBMJzvcpoHw0msOyjQuOYefGImx0/410Srg==
X-Received: by 2002:a05:620a:2228:b0:6ec:51ea:33f3 with SMTP id n8-20020a05620a222800b006ec51ea33f3mr1993733qkh.325.1669061185749;
        Mon, 21 Nov 2022 12:06:25 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id x8-20020ac87a88000000b003a494b61e67sm7101160qtr.46.2022.11.21.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:06:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/trusted-services: rename bbappends with git version
Date: Mon, 21 Nov 2022 15:00:47 -0500
Message-Id: <166906085078.3764609.5507574773203267297.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221117165941.26145-1-jon.mason@arm.com>
References: <20221117165941.26145-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 20:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4151

On Thu, 17 Nov 2022 11:59:40 -0500, Jon Mason wrote:
> "git" is the version and need not be part of the bbappend name.  Since
> this isn't being done in any other part of meta-arm-bsp (and not
> uniformly in the same directory), rename the bbappends to have the %
> wild card.

Applied, thanks!

[1/2] arm-bsp/trusted-services: rename bbappends with git version
      commit: a68a2a206eeb1427b4217b8831439cbe56341a14
[2/2] arm/trusted-services: limit the ts compatible machines
      commit: 7b4c17632d07044c1a580a90f20a2dbca3310fe6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

