Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20733C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 17:50:32 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.15397.1642701031396183299
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=kJM+030o;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id c190so6680146qkg.9
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 09:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mL+d123YJ6FnT675dfHhKnOpBYXcy1dKXVLRZjnROoM=;
        b=kJM+030oWFmMt+0qzDHN7BrRG87hVxEELrv28bGHnjYr06VA0DlHG6E500e5fSeeB5
         kTl66MOmnKKEweKkeq65drsBtFlJVi7+tIhl8geAuW1aVWMg25YQJDmP6efMdrxllg2w
         41xw4prvzj9C0P4Z7QTw89/4B4VDpiNLleXNEfCkvF2bm3x1tikFK6ppdmz/z6UHQQ1O
         FH8F9m6C01rmnBYmzMufWtrbbfo7I6ZAiZ5Oyj3FKsSs7EYWmOeYXBU1bf17auZGkK26
         ItPxHuePbaP/4Ll/evQPrcjUblmWQz0ZaYyTAmLU1xINCVGOxDnScYYHHVgChqgUsB66
         5c+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL+d123YJ6FnT675dfHhKnOpBYXcy1dKXVLRZjnROoM=;
        b=K9rw2CVgRM7PJOitullYLxZbFWh940Dzz2Jh9Gr6KaZD77wn3XSFfA7JrGQT7v0kjB
         s5Brl+eqgk9JjH5A0SCtXf0Bk7eXnJ18hWLnZiJCBq/YNIC7xGFgDL9dxkQra23bGF4A
         77CP7Lzj+HZssmkRqg6E1xnLbbI1+tMqh4kNr4K3XeOcmEMTzn5Wq5s5F4RFXivo1IJZ
         G5psxtSyBUjcd1ZlXfLSqtzt8ZfZBpPVwM6qn5MfPDe3bYw6Hi8QBsSAxiBOw6dR+49u
         rG/eEQvqvKrTvwR8fNNxIyDOuH/s46orQle+ZZ45Ca90lxn49f8DcF4O6LfTm0gsl9eO
         rKqw==
X-Gm-Message-State: AOAM532NRXmDlu8Bc9ALDtgUdpFbQ6pssQIzM/7NlFIjWW1PKaXpiEMf
	6vCQdjj4wHKSDSgAyoQzh7P4sYxxMINvsw==
X-Google-Smtp-Source: 
 ABdhPJxTehaXEBpnf6/TkU8eCRQIEkKl6TGQkeNrOIdGm0hGT3mtHI1m1rEXKF+MTKZ4AiuMF6f/Uw==
X-Received: by 2002:a05:620a:10b9:: with SMTP id
 h25mr16525524qkk.86.1642701030480;
        Thu, 20 Jan 2022 09:50:30 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:86a0:fa:bb0f:c64d])
        by smtp.gmail.com with ESMTPSA id
 t20sm1754452qta.41.2022.01.20.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:50:30 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] ci: use matrix for yocto-check-layer
Date: Thu, 20 Jan 2022 12:50:23 -0500
Message-Id: <164270102559.202212.15298998797934041173.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120163116.30501-1-jon.mason@arm.com>
References: <20220120163116.30501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 17:50:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2881

On Thu, 20 Jan 2022 11:31:16 -0500, Jon Mason wrote:
> The check-layers task takes longer than any of the individual tests
> running.  Split this up to take advantage of parallelism and speed up
> the overall runs.

Applied, thanks!

[1/1] ci: use matrix for yocto-check-layer
      commit: 2766987583fc19ad1daeefb8138ac01b2d2b886f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

