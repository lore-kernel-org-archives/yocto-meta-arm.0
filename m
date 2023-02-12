Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E183C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:29:43 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.432.1676237383016515216
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 13:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=oGjLSU1b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id h24so12074637qtr.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV1A44n+5pcoD+FNlsq7NXlT0DIsGyrHLH1XH21N1qQ=;
        b=oGjLSU1bVMTLo5WVkFxexIHMoFThmvRV94oD9qy1p0qlcIeCp5q2oH8cYuRVYEiFDb
         vQkL5J/y+7NeDQjzZxpPcmkjWgY4NfmOKEPsJTJ65HDlR0So5T5+FaxYJhwSqTZ1QiRT
         59/9X0fUw+uKuKNlQmeHE5f0ahaHZkGfjMD5262n3tZv0mu6P28IxPV/w4ozUWjStcEm
         esK5ki6f4hTq6at4qcBqeS5YnaFFJPfMW6UPT0kpw33zgw8VqMhmH7l5iFIBB7/O6E+n
         K+ygfF5weFCjyZcXHxOXNweIfjh7bpLLKIvyBjX/Zn87tIZoN7r6LYs5/vMy/cZM7qa8
         E5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV1A44n+5pcoD+FNlsq7NXlT0DIsGyrHLH1XH21N1qQ=;
        b=Z4eNQNr/r3x2gOiO6mHBCXPqXwH42fw4YHSCbyAZozL9ZeKR12p/y24ZzlzOEggqZp
         N8L9cJ7P/rb3bdbZVqkv/07lULKQslsKkITb9/Aw/dmFSKSj7qvdapnNGIF+Tzc8WF1c
         t0YElbDMU7HOJrWXwOoAj/3aN1WBlcwh90FGUtoUHiBQOl8YZZt2MfdwQaISknXbt42Y
         i0a3B/LWFYdpu0ahrZ9lOoRYJBqSxnYCplhpbAJbpbT8cZEs/kJqbMP/TtkpNgcHwMu+
         FIVjXCZN6nEtmaixTKYK+SkzfSOuljpAEKLUJeNi+BMMjpEFnqHfM5RNiIDtinh0RBO9
         Oyig==
X-Gm-Message-State: AO0yUKUKyjrgqJI8mq6NbX4jjKnZr17uglkW8XJIqblx/QPeR0KDg+P0
	vm7t9c6WXOYIT0DE/PRgiYnnN76J4k2IY0X+
X-Google-Smtp-Source: AK7set96wCvC0EQBuP0Y5C5mO3CH2Tv4p+jyvHlWODMoIe0c9FMbhVXQ+lGaITtRZA4eLSfCPQCc6g==
X-Received: by 2002:a05:622a:1aa5:b0:3b8:61df:e298 with SMTP id s37-20020a05622a1aa500b003b861dfe298mr41403014qtc.3.1676237381739;
        Sun, 12 Feb 2023 13:29:41 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id u64-20020ae9d843000000b0071b368cf074sm8319484qkf.118.2023.02.12.13.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:29:41 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/trusted-firmware-m: Do not use release branches
Date: Sun, 12 Feb 2023 16:29:30 -0500
Message-Id: <167623737071.3515638.15747661651457326854.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208202918.2662658-1-ross.burton@arm.com>
References: <20230208202918.2662658-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 21:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4384

On Wed, 8 Feb 2023 20:29:17 +0000, Ross Burton wrote:
> TF-M does not use persistent release branches and the release-* branches
> have been removed from the repository, so switch the branches to master.
> 
> Also update the tf-m-tests SRVREV to the 1.7.0 tag, not the RC2.
> 
> 99% based on a patch by Peter Hoyes <Peter.Hoyes@arm.com>.

Applied, thanks!

[1/1] arm/trusted-firmware-m: Do not use release branches
      commit: 4ec5d8b306e84f929188e038b330c01d68dabd3b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

