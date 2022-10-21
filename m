Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718BAECDFA1
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:30 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.673.1666390042675622914
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=wGdsxqMH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id h10so2755898qvq.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSmrKra7mAtzYUq8dZRf7GAULFRZHzA2XKkTIm/9dRk=;
        b=wGdsxqMH4nEMlqXchaq9kBFFnXzyYjDfQydqL1z+7OVdrq5rXLVMc1zJ0d57kOG8E+
         19R/s/Sn87IkszEwLbdYduaf+KSCNWaie275b29BKyEti55sLfccS0awqxP40W6E1ci/
         my/lcB5ZrcLk7zfxoIM7K/uCiIdvH4gj0zttIPr0nt/PszCY8rYGGJxwyOvCUmHL636J
         9D+og4Zq4EVutTa+EyWdWQdiQ40m/cgrJp6tjPyPKFt9Zy6DOWhN357GZ0dHjZB0QMob
         asTs2S+UqT6ICqTG4gaMYOgnaX65GNWzS5/mDccbOtEwISSQBuwWtmDFUZ9PQgyMgM5s
         yoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSmrKra7mAtzYUq8dZRf7GAULFRZHzA2XKkTIm/9dRk=;
        b=79v4N+b36KdH+2xVHaM+VQv6VgePiH1OYK3+Rsdt6tX7xEGSqQ9VnKagU2iy3jjw54
         4swABkhZ8xp06JUiXWOLWte86DMzJcRAmsXBc3JYHFhFyHVv1OPoLArdyE1Qd/aU5qN3
         eOAedgFzsDE/a9GL5hfl+dPlmmb4FvjBDdkmOp+B0zwi2ZrXg5xFLgZKxTVnJLkPmQKa
         lcq/ZFw1beMYgXUIJXEyiRsizE2pkUdKxX3r23g8DC5nxZRYeGY8RDh2Q96sr0aLGpx5
         FWULOCUP6uUdR+6ocJTwc8JXlNdu8IFpAZxFkzlqUvVSTy3dJ2EGlLjI08iXI7S1KJRj
         moYg==
X-Gm-Message-State: ACrzQf1TrsW1g1Ktbr7aDKFe41rt9mivQAqiRUBMa+5rKioPUR7swH0D
	YhwhFVf2VPa5OSbJcWrZGBZoAz0JxnZoxg==
X-Google-Smtp-Source: AMsMyM7irdcYwZuh1GU456A0MX3L8zFi0bh+qM8GxZ8XBukU0wiu2FarC9pbVMNaj5OaH9Akb6PBUw==
X-Received: by 2002:a05:6214:29e7:b0:4b1:c8f7:5ec6 with SMTP id jv7-20020a05621429e700b004b1c8f75ec6mr18590430qvb.79.1666390041378;
        Fri, 21 Oct 2022 15:07:21 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id bq36-20020a05620a46a400b006ee77f1ecc3sm10259926qkb.31.2022.10.21.15.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/hafnium: add missing Upstream-Status
Date: Fri, 21 Oct 2022 16:01:43 -0400
Message-Id: <166638250645.2629587.12930441257974050462.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221021162434.1559393-1-ross.burton@arm.com>
References: <20221021162434.1559393-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4009

On Fri, 21 Oct 2022 17:24:33 +0100, Ross Burton wrote:
> 


Applied, thanks!

[1/2] arm-bsp/hafnium: add missing Upstream-Status
      commit: 3e7dc144b12674e2ffec5f41832afd26cd8e65af
[2/2] arm-bsp/linux-arm64-ack: fix malformed Upstream-Status tag
      commit: a27735f0d63f6b51632947ce3c925175a1397b04

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

