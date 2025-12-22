Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A5EE67806
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:12:43 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84365.1766423561782355115
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 09:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mxDvgrkU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2d21427dso41103396d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1766423561; x=1767028361; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fb4HwkPmw8sIt1nNKWyCth9zWiVMNuS7Ks3BBj/r3Y4=;
        b=mxDvgrkUNRH70xSzr5Y1+fujM7Cp28IY7OlZfJmsNY6rujA8irdxvlridF2T1f8kkt
         6d0RnRtTYCijGxgPvuGXekLO6bxaD8q+eS2CFSbVM97pDDw1BS4PqceAVklEF6/oADeZ
         9P6b4t8nKBBWzZBLkQyS7gXiYun5f6Pots1e7rGHu0XGjgtg6HesQSywI3gLmrr4rCE4
         pkZSid89JB87/MRwQz/IKa4oQ5LAuphP9Bb+sr18Yev9bmDsnnmMsjLmwo3uY5jlzpyS
         cyeRNmaFntGiAn4RZtF+YksCv7MbDnpwQqQogQSQoZdgxaCKomBd7vxxTvV1gvszOLM1
         lGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423561; x=1767028361;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fb4HwkPmw8sIt1nNKWyCth9zWiVMNuS7Ks3BBj/r3Y4=;
        b=PWT+lSqvLy9Cydq6OCkT0RH+MPUu/PuR7m5XLLvmJJeFLkdCQXEV20nhVPLvSqj4yQ
         +xtSDHGmXoDxcfba4lw9Z3wK9aGROQV0WMJowd1EYfMqyWCmR7P+QTfo/eQO7paJoofb
         2xQbPk/f77z6JsuRdU8YVZyw9AsCEO+i8IbBbjyiD2pNbFSo0jnQdJ3OdY75JxW2VDRZ
         +JYbknEjregLoK4Mofrd5TWxMvRsTkwFyOsieTF06fwS3coykx+dUaXweGpibtCbohQK
         zTdERZ0ceCsGfzsNsV3zbyZ/pnnOFD0hmJ8ld2CcaPIh8nuEDMRpPoypnNzlu8RdRoVD
         MLzA==
X-Gm-Message-State: AOJu0Yw1DpTpr69B/Ke/SoFt3zoBzDnu7E2J5KE3ovfxCFXZ3Jwl9x3d
	qZsIvtxaI4xCK310CpF6zNFpUtgYNoZ8XTYiqF87QiJ/hRxL9QEfqD+Llia5SCpjz4eHjM6St1D
	gUg0=
X-Gm-Gg: AY/fxX4eNaHWhVF3q+6RtQBqKEdjBiwDUEvxtJ1KQ/iaGiv73gYbtQeixCrzLdlfxgr
	I6ZVzg42lSq6ChLlJc5bR7etmKzJ2kjD8JPcXRQyxj5BtkN8wgVgUG9/xF/KDQlPw1fWdY6lDig
	elEjM2wRv5bnAM/yJ9P63j8WEkHOAkJgINcDTAc8VARSsl0aEnLTS/BaswVE5SJymk3JIGEYlrJ
	XrbGDVpjrJbBFMQADtwq2UvnuJyJSzdWDYVkP31K+92VhfJaynPWmiEIblc/rNSvuUHGKml7Cpk
	44lw04BJbV3bk/y75BszhHbbZtU0PPx9H1JRoRWge9+5dcfJhsaZaOpEhf5cXvpEVr7A9WdSRmD
	FBoC+H9eWWR6i9VmMIUir01/TL5WLrwEUG8hZy/BkO/fKc4WW5thtXXDENu+cRidgizRh9YPeQX
	0jLQ==
X-Google-Smtp-Source: AGHT+IEJwQQySR+Vsc1MokJUPpAm5eEfbjJN5v3Jb5OjlL9orF2ghgpE3xWXCeBm+fjuzlTbY1UX6A==
X-Received: by 2002:a05:6214:e49:b0:88a:525a:8db8 with SMTP id 6a1803df08f44-88d862905b4mr204998086d6.35.1766423560338;
        Mon, 22 Dec 2025 09:12:40 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9624015asm97776486d6.6.2025.12.22.09.12.39
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:12:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 22 Dec 2025 12:12:39 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm scarthgap update
Message-ID: <aUl8Bya2vX36iTm8@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 17:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6811

meta-arm has released an updated scarthgap support tag, 5.0.3.  The tag 
contains 2 patches from between 08 Sep 2025 and 05 Nov 2025.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 5.0.3) with a yocto-x.y.z tag (i.e., yocto-5.0.3).

Thanks,
Jon

