Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F9EC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:12:16 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.131.1686190330193377784
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 19:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2McySoXl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6260a9ef126so1045006d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 19:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686190329; x=1688782329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg5NOG6yb1jKb8KbWcQ/ASDIIhfcGIxmtFR7sYkqurc=;
        b=2McySoXlUOzrqZN7JE+j+IdgeEFcLN6Z3OfQNDSW1KtK3zGE3WTZsFTh6S4mkv7dle
         TtR3DivNp528fl9zo5BwsdeAZjNq9NUDUGEriwdN+/Yx3H/KqI+/o6Bq10Kp7jfKQitc
         wYmCT2N6F/p3zO9b7+KtkUZnyWIOPQwnZ5fXRn4j4tqw+AkdhkQj8o0HCD6ZHYhQ3Y6p
         LXvfvj1SRcYxCrjsEbw8pItI+xuCzPsF16osAIjSH9yZyO4wDdlqA2MFSg2NsWfbdf5/
         bK/7HQjeGTroV8gPkvnDxhgtvVqMMxheS6ub6Nwo0m6dPZvMNSO8az7z2dOTyIOowqSm
         sWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686190329; x=1688782329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg5NOG6yb1jKb8KbWcQ/ASDIIhfcGIxmtFR7sYkqurc=;
        b=eYl5hjFcMp2mhoIJYRn3xOut+x9d1Pg943G+JrNqEKJP2LVrjTWj6tFsI4vLyOk9wb
         vrOVhsAswJvYV93u4z2m6AgO7+p3GOE2cRV5s3f25P5sPUVnyq244PgKoCEUOoBG4eBd
         pLj6DP9jO3eWEbrO9rBnvlbBhdI5DjqdcQ9qvZH/5jfulQuuLqrNx3qheNNyCys6WhAY
         +0g1oeaIQk0vstDWqryXzWdC/Br/tJY9zzeztaYfjRYVFpSsUCtibk+bekWc8o6v4D3Z
         n6DUWwdVTDQ24eE6iApmgoFt0+u7MecTUCkvJcSPuk0jaz91WsjvFm9GSPDxe2rAXvm4
         c5PQ==
X-Gm-Message-State: AC+VfDw07zd6+P2XHdpXHbOQpS4nYch/a5kTI4v//WZbExiwuhFf5vup
	qMVEERaWCJVVfK7tsEzzEfEX6U6DMF0g5i+OUMQ=
X-Google-Smtp-Source: ACHHUZ6rtut1nA+XW0Q90z5y1Tk1W0f1rjLezTXjKPxT9gD/ODEBAfLT5gH7FnaRQhmGyQRTEpv40A==
X-Received: by 2002:a05:6214:250e:b0:61b:6a44:5f03 with SMTP id gf14-20020a056214250e00b0061b6a445f03mr207495qvb.33.1686190328950;
        Wed, 07 Jun 2023 19:12:08 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p8-20020ad451c8000000b00626161ea7a3sm89280qvq.2.2023.06.07.19.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:12:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/trusted-firmware-a: look for LTS releases when looking for releases
Date: Wed,  7 Jun 2023 15:33:18 -0400
Message-Id: <168616639801.3869142.4541610254807405684.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230606155146.3937833-1-ross.burton@arm.com>
References: <20230606155146.3937833-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 02:12:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4748

On Tue, 6 Jun 2023 16:51:46 +0100, ross.burton@arm.com wrote:
> TF-A has LTS releases, which are prefixed with lts- for some reason.

Applied, thanks!

[1/1] arm/trusted-firmware-a: look for LTS releases when looking for releases
      commit: ca6df873151644ddc1e6ab0d88b2dc67b10a2c31

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

