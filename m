Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7CEC30659
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 22:23:29 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.6908.1719786206593376580
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 30 Jun 2024 15:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=kihssWID;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.180, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so2436546276.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 15:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719786205; x=1720391005; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuPxrsBEdZB9fIbQoiH7vZ9QUyn+Iaomkm0O91++awQ=;
        b=kihssWID9eW43w5hd7INxebJrG3z8puhQUML1N58ONV/t1liFmOIUX8YyFjSNdcwTC
         wEC7/gnfUMYNCxe87B6Bi/nSruYdTdM+lBF3QWXd1eDHaGH1289gY8kkv0bgoctEQSoq
         88y7ucwFaZh/QDlokw1bmcs3jocqs+l02VtPf0o9Bp5k9Eo6rFKy9IZ2df6LkK4H5593
         P1KUp+ulIqxUH/lcOAspGTgb2o9DsNQ8oYViho4ROUI6JUB4DgFnwi3B/u5Ssyk9AZ2p
         xH1PRuvixRzO8W0RwhnYx846et9dUXDFoYn4ubIBROyX2UUtavMKL7j+bMRb4XqXCxb1
         fWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719786205; x=1720391005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuPxrsBEdZB9fIbQoiH7vZ9QUyn+Iaomkm0O91++awQ=;
        b=moUxnIgPWXM2EcC7j5/W+NnotxDqOmZ7YbnQDovF6C4pzKXrqP3Fis7daBvtSyazZT
         nIvt6rzbtYSO2UgDGMa8suGyaFOzQYS3dy4DdAOUqZkZdTEFFfk5zUy5PCJIEgk3HmIw
         fuGzbmoHY3wMQd5y7+ZW7ek6CuLxQTCXZewHvrmYrLNg4vVEinDSpqK+byWz3maAH1jG
         mgna30dj8xHprnhHpbJu3hh78RHvYzN0IbfMi+uyDhoTzsJDAUlePUGk5tBaXm+eqKnB
         mAD/XOD6zE406ZMnpPtevE3seb2tNSB8wTIb+7mNXFtaHncuRmM94uVpnz6LdPsUPI5b
         b1KQ==
X-Gm-Message-State: AOJu0YyvlIsH6JTNWwAhr7ikxwkhAdnIcgsmW+JMfliEEw9uf/HMRgQl
	fvO8BUlBPTHjdhyDTeFL5NbjVbV25O7gGm2OfeeVQK+2R3pPWVFJng99bisrEBAIBH6nRE+rxuU
	=
X-Google-Smtp-Source: AGHT+IHzLEaBoNQpbfc/11ComTnrU2LYqZiIeIGn0a8sCMmTjHccxGEiSxHrBfYQQjnoPmGhv3tvEw==
X-Received: by 2002:a25:804a:0:b0:e02:b434:372e with SMTP id 3f1490d57ef6-e036eb28ea1mr4740915276.22.1719786205399;
        Sun, 30 Jun 2024 15:23:25 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353ea398fsm1118131276.28.2024.06.30.15.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:23:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: update to Kas 4.4 image
Date: Sun, 30 Jun 2024 18:23:02 -0400
Message-Id: <171978618234.360838.18147696072122622254.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240626154325.2165430-1-ross.burton@arm.com>
References: <20240626154325.2165430-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 30 Jun 2024 22:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5854


On Wed, 26 Jun 2024 16:43:25 +0100, Ross Burton wrote:
> The Kas 4.4 image includes the websocket module, needed to use the
> public hashserv/sstate.
> 
> 

Applied, thanks!

[1/1] CI: update to Kas 4.4 image
      commit: c4c562c179e670c4306c40a4214e21ec2f71027f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

