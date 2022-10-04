Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FCEC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:30:19 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.15107.1664911809479901417
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ozMUFB7F;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id h10so7605475qvq.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0Wku4/wXoABKEq3c+DtQLTcUpYF6SQBoQ8tjA3s2Yew=;
        b=ozMUFB7F97NzP7sPoqgXAnzrHTSYpB8TRDamIyGLXvrHT2rY3Wo1g/1nb80BM8JIwO
         qqZEXn4uxPHedaj/k04lZaZkeYSYXL9y4FUCoYGwh8C/3kT5ToWeRkScdQg8WuPNwi0e
         mJy8QVm4LKi/dx0yJxVYwpo4fip8iTQRvo/6Hzz9IInjY+SgPWiEEWZkPpsmP4gePefR
         Hu4DJxiNIRQ3Uc7hsjB1jTe2aNnhTTyOvW+QvF9BR4Dg8VAMqmsZJ4yAfya48Z4/0sbi
         ftXdc925klvHJiuoXpJjQ0mz1oQfEb9T4ODYyAOe3ZaIBnKGZvm34rYGdI9ceGpT1tJ6
         ughg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0Wku4/wXoABKEq3c+DtQLTcUpYF6SQBoQ8tjA3s2Yew=;
        b=vJ/YftdhNN4D9sClwTIMaFwYid8dYzpEXwbRcoxXQiQWDdG8dUGezeOY+z7k3Dfrvf
         J58APpuwUv6e0M7Un/PRDryxY9w3hd0U+ULjOwl0B7mo7D/1TBsdvLZA8cI9k3UOd3+w
         gkwMRFInNfRRf7a/XCAbRV3PUzusbpztRuZWeoUbjlsTEl86N1ugz6WwWynMa5+5X3I4
         sMYs+pVpEXgDBjuAa0b0DKKapNeJE6cnCZKHSQj6sOXTsTpqNkjLD4kuwr+u1t7mAhpB
         +CKu4x6aLFpactTMK9WZDshWK3BLhrMWqoSHfXDNAIAIY8KIOpl+gncBoiunanEafapn
         Qfuw==
X-Gm-Message-State: ACrzQf2kisipyvw3YsnUdU5+IsUsHqNkKn9QnAS9AUSd1+Jp6OgCYezS
	92vh77pCcmwIND/IztbHw/zJjZomuGoCsQ==
X-Google-Smtp-Source: 
 AMsMyM5EgTbZK5Vg0AxN9sXu1jvPRL8detd5Z+TvYIOkd5waqbuNA+8K3HqF+wtD7Q5qwde6HQTqLg==
X-Received: by 2002:a05:6214:d85:b0:4b1:8e37:902d with SMTP id
 e5-20020a0562140d8500b004b18e37902dmr8638982qve.120.1664911808169;
        Tue, 04 Oct 2022 12:30:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 m16-20020a05620a291000b006c73c3d288esm15009147qkp.131.2022.10.04.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:30:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/optee-spdevkit: remove
Date: Tue,  4 Oct 2022 15:29:53 -0400
Message-Id: <166491179508.2384963.4455607381192834866.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004163128.3867085-1-ross.burton@arm.com>
References: <20221004163128.3867085-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3923

On Tue, 4 Oct 2022 17:31:28 +0100, Ross Burton wrote:
> The "secure parition development kit" is obsolete, newlib is used instead.

Applied, thanks!

[1/1] arm/optee-spdevkit: remove
      commit: 932db44b201b0227136e531dbde62d76ee683bac

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

