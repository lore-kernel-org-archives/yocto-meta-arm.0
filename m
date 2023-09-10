Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71067EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 22:01:13 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.45998.1694383272314475454
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 15:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ptZsdsaJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-76dcf1d8957so228539985a.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694383271; x=1694988071; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b3MDefr4QOZb7iJm6f6W3FRgyUUO4OM4I2IGtZakWQ=;
        b=ptZsdsaJfM2flUukiL27wA6c+qPzd1ImGKV4vtNv+KMIaAvPuy3WTbNMHXBZ5EeInZ
         /kfeohY/WQ5kj635jzSZqdEVVu32wPXOBkqwxKrBaOQycn9BYeKeSbC8qBEHw/XHEQ14
         yXjFiJ440vDnnh2qLP6fC5NbKZpqGdxyN7P8eHGWlfob0tp4QudHqh7HgS5SFWwiVO3j
         GBaC279fnHYdpQI3LQa1V6VXA6TxmR2t6cd2bl30SN2X3HtdQDQi1qVFe+uSxGXn0A4W
         ANhFk/mPQBkB/sXxPFbyS56/KvX77j0f8IN6m9iO+cZ1SyW/60GVKyr4Dt+znwpMw1+6
         +uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694383271; x=1694988071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8b3MDefr4QOZb7iJm6f6W3FRgyUUO4OM4I2IGtZakWQ=;
        b=T84Z1MGYjLHjgBksrghesOzFVZfiy1qSsBixxTQK6QrOl8ZNrBfdlB5Wsg4rOr97bt
         LwwycxIXfwfG5e4SLDQ0XHRAQJ3qukMQtuWjJm6yQFAK5PN1ftks127+YsaOJIQjYNEv
         Lt7ncgiLT8V/6HhaE76gPEx78t0J8xUXZEEbN6YHPPZl/6WvqdRUnuEfxChB4LUB9WMe
         8udoguSzlIn6AaLOUnuHeEY5CjEWK18Tfk4pbrzefMsxaEJxhPI7m8a21SdXsFjc5T2g
         QbqoKKk0L4jOP6MmC4SvuoKYjldUc1/dV10d/7HVx9Hjd2xvHBIBvfWKrENERhG1s91A
         or3g==
X-Gm-Message-State: AOJu0YxlnSOR2mMUvDzzinTze7UU8qoOCJvbJ9rw1x1K4cC21vi04oWq
	LdKfCdnKQvOle6xw4F7RdPn2SxX91If+iP6MkUc=
X-Google-Smtp-Source: AGHT+IHFuH+fa1sStiqw1r1CxthcI6YsO/dHF5kCyKtHc7Xn5/KAGTu2T7KpXrBJndR2+2Eaxr2UAw==
X-Received: by 2002:a05:620a:47a5:b0:76d:966d:b30e with SMTP id dt37-20020a05620a47a500b0076d966db30emr8671771qkb.6.1694383270940;
        Sun, 10 Sep 2023 15:01:10 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id qj10-20020a056214320a00b00655f35dcbcasm36120qvb.75.2023.09.10.15.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 15:01:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/sbsa-acs: update to v7.1.2
Date: Sun, 10 Sep 2023 17:59:50 -0400
Message-Id: <169438319106.34322.14418154863408924749.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230910134313.3735787-1-jon.mason@arm.com>
References: <20230910134313.3735787-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 22:01:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5028


On Sun, 10 Sep 2023 08:43:12 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/2] arm/sbsa-acs: update to v7.1.2
      commit: a4db5ee2cd028e2f321d040666e4b0f06fe3ab24
[2/2] arm-bsp/trusted-firmware-a: remove unneeded patches
      commit: bd0953cc605d01612612b0323f0403277ab99852

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

