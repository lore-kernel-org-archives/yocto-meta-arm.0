Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72855C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 19:23:10 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.4098.1711740183473122810
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 12:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LUeki+Uj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78a66ba49dcso144137085a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 Mar 2024 12:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711740182; x=1712344982; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbwnM7gCGHEq8iXanoqDjExi/8mzXKNlNGZBcGynERE=;
        b=LUeki+UjlT2CuQsbuMmr9FHvslHIFDC5fIe5/JgEI0aG5vvHUaXcqCm9YK5RErERoS
         Nl8ZHIcGW6Yff32P7XstRPjLcT9UBkSnoAPtIjFfqrfZUsr/VzxZb/5yyWo2wylBeDcT
         mzaNG6wtW4W4A8OZBqS+DiT1fxaPbzHmKXT4vrYaVZi3TfPfFa74qGFyynEncwZVUWgW
         g4p7ubuClJjoCRfRwlCdJ9gL+OtiI1kZ5f1aUaiAtsSfPqrWwxgCKlube4RI5QUbVfAG
         W1fe1k3RzYwMzelQ+AZZHeBwzZK7rhbG+SFCYh2EbJABrjr+kqLNG50bjXZGNrjy8tv6
         Tf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711740182; x=1712344982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbwnM7gCGHEq8iXanoqDjExi/8mzXKNlNGZBcGynERE=;
        b=DgIS87v9SwQ6WF4FSwOC1beqTCOJn+le/kZvqTqzZDoPlaCzW+fT47VQ4mVny7RLlj
         B2aEjHWpBvDYM/FbHivYq2iLnKrtu9DaLytDJ1C7Bf/MfjEejTCxK/mvb7OHWtGvD3p1
         9J5lwUYrPVW13rzc3AstPnvso8tN+dsiQEiSY08+Lj1/8zFsOM6StAViF0vDMmTGC4pW
         TOazcamnh7j2U7A687CHW/F3VwoRL6sYUS+58viN5PQr99AC27T6kLB5YzoU9nkXwA6Z
         wEHfiXUtGqbWk611Aw2CXGvKdTLHfBbcxZCwRXpaxY/wAYlCAfNRigfRL3EhJlsQSi23
         LyiQ==
X-Gm-Message-State: AOJu0YxcK2zlaipLsSlkrD+OIwvc/Cm9N1WakLeb7FB4KLEILr99Ixu6
	cC2PXBQ/WQDxxZmgLphbuQWb649MaMrVOcY2dBOUhTgjPraqL/Ae3HJpIxywtdIad6fFqOorRV0
	=
X-Google-Smtp-Source: AGHT+IFUxPAL88UDxHeXxCHGixqANzglwPe8wV0yMGq4JOvuBCTwQTChU5lZ6yj1S6g02I9LpbWUZg==
X-Received: by 2002:a05:620a:cd0:b0:78a:429c:bdb1 with SMTP id b16-20020a05620a0cd000b0078a429cbdb1mr3083237qkj.35.1711740182386;
        Fri, 29 Mar 2024 12:23:02 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bm4-20020a05620a198400b0078bcbec8693sm548873qkb.91.2024.03.29.12.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 12:23:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/sbsa-acs: use UPSTREAM_CHECK_URI for version checking
Date: Fri, 29 Mar 2024 15:22:06 -0400
Message-Id: <171174012661.4098959.524702344817444526.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240328201206.14812-1-jon.mason@arm.com>
References: <20240328201206.14812-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Mar 2024 19:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5503


On Thu, 28 Mar 2024 16:12:05 -0400, Jon Mason wrote:
> Since sbsa-acs requires edk2-firmware, it bases its SRC_URI on that.
> The first entry of SRC_URI is what is used to determine the latest
> version.  So, specify an alternative URI to determine the correct
> version.
> 
> 

Applied, thanks!

[1/2] arm/sbsa-acs: use UPSTREAM_CHECK_URI for version checking
      commit: 7163b472ab8a5de852508de5e60148d681f4e21e
[2/2] arm: use UPSTREAM_CHECK_COMMITS for git versioned recipes
      commit: 8d308aac029f3c5cd08100f2978d0c28bed4332d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

