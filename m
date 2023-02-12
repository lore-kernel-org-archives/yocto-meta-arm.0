Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEA0C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:30:03 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.438.1676237398636494223
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 13:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=UEBNDMtB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id i12so7317550qvs.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VraIl7EoISQ0qWjRirqqyJlesIC71WUhkDp3f3OkMeM=;
        b=UEBNDMtBnPDcOjmKC+pza8xewKMKVxFcJab52dozQGItHFHijjThqWCY4EsfJe3Wcn
         mjJCgLDb12o/lTgiXnCW7HS3qBh+pDh3lhzWcXR9cNyX56zre6OdVE/JYb7Dq0DNfXAz
         vlAv0apzTDx7PiA1GEf1OmQrmKAeTE2iUVeO9fqLXUs6HAj8POKQOxr5L1ppaRQDn4Tf
         neRs2/0n+7E5WzH+3Up1Bu+SWk9t1G9kiGX9Gct4W6zhhbuaJD5RYN+0+wbrqYIX7kou
         3NURh9jxPSDdoSfJGC8AUw7lnRiiwgToO3atr1LpOw4EEZkUHpHJc1wYlgdg5IbVhMm3
         j5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VraIl7EoISQ0qWjRirqqyJlesIC71WUhkDp3f3OkMeM=;
        b=cb+CVsCOcSH5YuPMPWW4CPsnA54fr5xx2OU+0xxtxEVT7J2i9Opr5cwUT9+3ceA/j5
         ksvSY6zL78YuE0iPp+YMkbuKkUhUbsDxkUVjYSzxVJlfeMVtBc/xil+TVjxQ7xF5xRKs
         s88Cp+/29aE/rQHV3Mqow/tXGTaM1M9tYUl2ZIzYDJbQADu4ZDEEQzPw8UJBHbFfTo/T
         gvsaGVgN8uq8M23IsckqKqFHmOXybKvAyE0YiJdUTA7W96VbX3MUNFtefJONPJPtgn/V
         CrXoKbRrZ8zJ4dg1mZUu/0QD/OsgNXJAmmFnxNm6juKOaIl5MFZjCniFV3vYfVC5dyei
         5r4w==
X-Gm-Message-State: AO0yUKX60KRh5S47YPC54JAaeA4K/xLMxJHXlbb6DDkR9JRGmA6EGnNS
	LiVD7qIYyJwd4U0TrnhkltnJ/jqOBzcOi2MZ
X-Google-Smtp-Source: AK7set9AJxNwdW9U0hoBElXCjSvfGljzzacmmz95BJ/hERU3LDyclc0i4BNhKGYp8onnTTJya8SV4g==
X-Received: by 2002:a05:6214:2522:b0:56e:99f2:1b91 with SMTP id gg2-20020a056214252200b0056e99f21b91mr14595193qvb.23.1676237397357;
        Sun, 12 Feb 2023 13:29:57 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id b77-20020ae9eb50000000b0071b1fe18746sm8352493qkg.63.2023.02.12.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:29:56 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: add 5.19 kernel recipe for N1SDP
Date: Sun, 12 Feb 2023 16:29:44 -0500
Message-Id: <167623738572.3515726.8295775749139728581.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208133353.1969816-1-ross.burton@arm.com>
References: <20230208133353.1969816-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 21:30:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4386

On Wed, 8 Feb 2023 13:33:52 +0000, Ross Burton wrote:
> Currently the N1SDP patches haven't been ported to 6.1 and the
> port/testing isn't trivial. Until the relevant team has done the port to
> 6.1, carry a 5.19 kernel in meta-arm-bsp for N1SDP.

Applied, thanks!

[1/2] arm-bsp/linux-yocto: add 5.19 kernel recipe for N1SDP
      commit: 3d39ae853c91c8464815d3c34b339438ba735c95
[2/2] arm/linux-yocto: remove obsolete 5.19 bbappend
      commit: 0617555fa5ead9bc1ab07b5a4de17e6c3da16f95

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

