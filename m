Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0B8ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 21:38:50 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.3218.1666906726735097589
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 14:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=c7VrjxrY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id x15so2696506qvp.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eliHYlMN48wwBWQScg4Ui3wjrI1yfsbBEFaYcWTrops=;
        b=c7VrjxrYFzWHmkzl+x2cQssBCnh34jdVT4Ls8fEUnWtzMDKwiH65bFNXYh+hooJp9P
         gWaBauDgDHSikUdUQf3ZV0ExcdC21uynZXf915frEKN/sPNFQDiAX8mgSJPMYf3sPaEo
         qFnp3xn8o3lP55+XW4bQrgtq2eGvXqhfcDEiqbSfv+zkMOVgtp74FkQhcmSRWH4kfpX3
         VLpU1VM06rsYBb4IWqafkVc5NfdiVnJRWlrgneeLYk0fs7Ogi6/9UuwXhRhbCOnVqmN7
         GuP8is8XAVPISptht3T+YwFZRHEwEWdl8mSSgNvBmTjOatCW9vlkdTRVhkTtIQN3/C2R
         0I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eliHYlMN48wwBWQScg4Ui3wjrI1yfsbBEFaYcWTrops=;
        b=2qifTYbYQW9lAYAYtIxVWJPoxDFHXcdWKGz9jaoCnLChzBzFN63BGyJlbtyJtC4BfA
         QDNVK03QUk6e7Rp+ydTWcP1IAqs0qu+xJOtWzjfzhvdBcw9sXJQgFPnzBhbpmXQLJVVe
         BFw3gIkf8z9MfjidoxDFhbUF1azQN2OIMtQlKRb6+KgrJkuIf5m76jY1xWvCZX6j7eq5
         kkXrg2oyfW9RO7y6cQ1wlLQzFTO/v/K2jvqE+cWy6bW5GbGw/CISrskd5iQkYLQz4NED
         MKfkUc86qY6nAb6XlLl+oe8L9W69lVFczpz1wdqKa6GuZae4yHGeyFwrEqhd4VAeMIUY
         1hMw==
X-Gm-Message-State: ACrzQf0fgcMZh8ODbbuz+Gv7MpGvpw9g+Oi5I2bRBDPpwljq+2Lh/N+c
	s3uYwjiza4oUGtLfSXDEe0p8Tynfq2A3SQ==
X-Google-Smtp-Source: AMsMyM5HpipLgL4iLXPohDZS5c7LbvVon5XLNUEQDjMuzS1PjGqAkIZ28AUXD5lTXwFBJhxBS/4fkw==
X-Received: by 2002:a05:6214:e6f:b0:4b3:f41c:a59 with SMTP id jz15-20020a0562140e6f00b004b3f41c0a59mr42714973qvb.59.1666906725374;
        Thu, 27 Oct 2022 14:38:45 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id br40-20020a05620a462800b006ec9f5e3396sm1687172qkb.72.2022.10.27.14.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 14:38:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [PATCH 1/3] optee-ftpm/optee-os: add missing space in EXTRA_OEMAKE
Date: Thu, 27 Oct 2022 17:38:38 -0400
Message-Id: <166690671826.1783399.14113675841760772359.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221026141854.1557213-1-jose.quaresma@foundries.io>
References: <20221026141854.1557213-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 21:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4056

On Wed, 26 Oct 2022 14:18:52 +0000, Jose Quaresma wrote:
> When append to variable a space is required at the beginning.

Applied, thanks!

[1/3] optee-ftpm/optee-os: add missing space in EXTRA_OEMAKE
      commit: 518294d518968a9f8895a17c5d6d0f1a95246ef3
[2/3] optee-ftpm/optee-os: rewite in a way to be less error prone
      (no commit info)
[3/3] optee-os-ts: avoid using escape chars in EXTRA_OEMAKE
      commit: 3080a94bde5a2f316960bc6a6c649f798a76e239

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

