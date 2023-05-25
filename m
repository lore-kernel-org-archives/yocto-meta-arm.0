Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4504BC7EE23
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:52:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.1923.1684975932141817592
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=Tscz8Sl9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75b1975ea18so23066485a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975931; x=1687567931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxJbJB12r1Qge9eTEzfESKJEFS6orwovULJf7X283+U=;
        b=Tscz8Sl9FEvGKnrQpL+FC7JsSB8acfQNuUm+Hd7uBGAYMtldDjiaboSvv09B0U0keo
         f4lxncbduG1Qx0av/inejrPrsNSAXQin+Z2YrlrbQEcT5uymcASglfLM5En8VKFs7Roh
         Y4HkcpiEXpiXVpDD6QYYb8BsDwMk/xDpmaEUQtjhqg3EMqt87GmaVlnSAUDtbZi6t6VQ
         N7bZvxBMEEKRx2wXcu/dtUq8LlmDqlOCvIwxnaP2ssyIXzCs6CjxjpqJFAPxkW8wWsdK
         76AJBJVYcTaDWcrLQ7vK1RM41EoiniYkdG7iUE9ynrKZjif+8fkF6lYZACJmLbmR41nO
         I2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975931; x=1687567931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxJbJB12r1Qge9eTEzfESKJEFS6orwovULJf7X283+U=;
        b=eYN6HGGTC/tECScu9B5NBHXubYtt0y8bKzgUkh+Gc90OI16a4NlMrBonkKp8vQc8YT
         HQg8NZKIu9pOY/QMTI3PtRG58YBBJX1/5Ky8Vu2ZOyD/F9VRbNfaUPm0EPxUq/u2iRvy
         nETuVS8zW/Q5IaPkgzMeOE85qF+2KII0AZPDD/+BGZZTaCVTx41k+Dk6lxfgUSGd9icB
         c0jOUbmB5YQaHMF4NEG5txPNyFdFzdVH0R+kj+5eAe3tazk3cPGkYwrOKgUeceYMqzzk
         ckB/JMQMcioBh9fSNqkr6vCFMTIsXU+Tiobs7IEUO+VI6E4Fly7bJy1eiELu+pXMLZwj
         Y36A==
X-Gm-Message-State: AC+VfDxvivj75Q5wBB5fGRt33kY8SV6dw66fauuZsfhDc45CIrj2D5tu
	Rsv62wcRiPdSefhPqaS2rDlvSSxJ3qm1mgFucCw=
X-Google-Smtp-Source: ACHHUZ54WVxEzk4PFRs1pE3BqdpVHkCP9zpnucnTT4/tQvqwRL8cyBS+Wo2vR/nQabRnJeFky0Y7NQ==
X-Received: by 2002:a05:620a:858a:b0:75b:23a0:e7ad with SMTP id pf10-20020a05620a858a00b0075b23a0e7admr7607961qkn.14.1684975930906;
        Wed, 24 May 2023 17:52:10 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z7-20020ae9c107000000b007517d8628b6sm20097qki.15.2023.05.24.17.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:52:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [RFC PATCH v2 1/3] runfvp: make fvp runner to hold the config
Date: Wed, 24 May 2023 20:51:38 -0400
Message-Id: <168497589902.1985833.12277641339791857057.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517100913.96055-1-peron.clem@gmail.com>
References: <20230517100913.96055-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4699

On Wed, 17 May 2023 12:09:11 +0200, Clément Péron wrote:
> At the moment the config is load and pass to FVPRunner.
> 
> Change the ownership to FVPRunner.

Applied, thanks!

[1/3] runfvp: make fvp runner to hold the config
      commit: 272359be5dbf8047294e519a512f4dd6348bde5d
[2/3] fvp: runner: execute fvp process in the same working directory as fvpconf
      commit: 1fa602ad3ba9356110c085cb9d92286d691294f9
[3/3] runfvp: update filepath in fvpconf to relative path
      commit: cb31d9e5981074f083ea287b6cf8fb3460722db8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

