Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB011C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:50:03 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.14704.1635353402670377372
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Wf1YJxl/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id w8so3068194qts.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=mFOIjFZW1vVEndg0ZV6e5uioNQvCJpPZj8HEm1LBUX8=;
        b=Wf1YJxl/35P/vX3taL5SuHU7YJAwK6Tb5HeR564x92zVKga/mdbAAWtHmiHAYaDZb+
         hbMSjT4o/4lmTMf71LWwQvfPXoHlaVGKf3rE2xh+cqwZju6PIlHJvAjDQVoi78hVyGQs
         q1asdFxT420Qk6hkP9RB2x4RLtYh/nFykCOIJtJyfQN7Hq9HS9RIapiW5cekbHw8B6Dz
         LM31ukY8NNfJO7MecWofQbUbQMCqvhk/34HgGdty+crVCziV0v51f2hmqIPNE1mvlH56
         Ws7QkQNQQRGHPfS7Th/upWhtTnPU7YpMkTdnwM3JvMN5141HaUduQN4jdc3vFyzSlqx/
         zj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=mFOIjFZW1vVEndg0ZV6e5uioNQvCJpPZj8HEm1LBUX8=;
        b=EUUGFKfdftZwj4/If2PI73VYQAp9gn763dtcZqZxDyv8vaQqcib6CRtbeiWN2JKicz
         eXFIhysww5SGzHqKUSHB8U7NK9LbPjwaQzRZJL5di47jfsivuaSzxOgPs80Jmih2QNWA
         RLzQ/vps7siJrAXM7wd/4ESLE/VxafhE2p3BIkBEE9v2tl62UNR2MOtxp4PaBULH/1lC
         vEuPR04GeI04CV2PhEEwOmwHucVFc8XzRjJlJKDrlFcsLhsFSML4rm8iUMvTGko9qokI
         Tw5v/htOTDhTpiOv2ulcqh72rpA9vqig+LPyrn5INbnhDPeYM6uH8gGVqSK0yDD/HS2l
         JAPg==
X-Gm-Message-State: AOAM530GWxL9dNXCZsVToaH+TRg9RWDNAjRYhQppQvixaYfv0Th5Mc36
	p75Q5Db7FImwhsAB4m3tfIaBdw==
X-Google-Smtp-Source: 
 ABdhPJwQOgsNd981AY12ZjWvPoxc9CnBzQ0jJ3KMyXsAyd6qrfbF08eUH52zQb5E5bg+QyL2yFhHjQ==
X-Received: by 2002:a05:622a:44b:: with SMTP id
 o11mr33802266qtx.359.1635353401699;
        Wed, 27 Oct 2021 09:50:01 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id
 c21sm321508qko.81.2021.10.27.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:50:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 12:50:00 -0400
To: gatesgarth@athena.kudzu.us, update@athena.kudzu.us,
	meta-arm@lists.yoctoproject.org
Subject: meta-arm
Message-ID: <20211027165000.GA17333@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 16:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2306

meta-arm has released an updated gatesgarth support tag.  The tag	
contains 28 patches from between 01 May 2021 and 14 Sep 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.2.2) with a "yocto-x.y.z" tag (i.e., yocto-3.2.2).

Thanks,
Jon

