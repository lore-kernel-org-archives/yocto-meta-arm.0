Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D251C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 17:09:09 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.20442.1676308146069269013
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 09:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=RSwqlTKZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id mg2so1562299qvb.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Feb 2023 09:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3slHrYu/5ugPl+6OD/C+KaAgduvj18XMRx1bvp/boo=;
        b=RSwqlTKZY+0Dxc1C9vUX4xwiTIRMti3vyAe1GRpuV3tL9LCodUCZj8DJaJ4asyLasQ
         X8YMYkHiR0PyZROu8Z9cl2UBh8KgsomlpIeFDWBnqKDQpF+qG03cOwsi7Rev9aOleDE6
         KnM/tgzeiZOZKSzKKfIbRKjWlJqKktbagqnI2AUt4k6Nw2j7kbitXBio+YyFo7Eper1D
         2jNUdgJ6WLZv5LJuvQwuAiq6+wBkubP6OrQcTs5BOB7zfE0mIjyY0kFPwAZC9YdlUo62
         ZLS84j0E4s/yRoLpFTAqqCJPMjR3l0V+EfAgqoVjHISOuvyzoaMo9dKHFw3JgW/42lGr
         s4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3slHrYu/5ugPl+6OD/C+KaAgduvj18XMRx1bvp/boo=;
        b=OQkxlgMh3stfm+igQUrkyyaQIQYXF4canR5w0QUhDJlaogw1l0m/KImBowMvtg97Fg
         coDiR/xM1fASRauMQNDnejlFE/mJT0ybwv/z92N8eOag+fYzyh5TdFEARGe7kGYFlBuk
         J65885JMGxqEkq6a2Zk1HUPJuXSA8srNZUraZaSwedeRixsrlrsc3p+m/kbuezFA7blB
         k8+2IRO7u7tBDL01vySdIE4KcaB8OzkTehaJ4aL6cr6Is4NMbHlwK8JdI8jw8wmZMJhr
         ix09GdsHVqLyY60W2nifmWigzIfG29Fr7DH1aioQ7i1N4Zxd9LtiC701UwPnCbknFMpe
         CfAQ==
X-Gm-Message-State: AO0yUKUuvb/BD4Z0Ef6YbzwEsVTAs5hqjfR5M/rnzUANH+o9j1XjcqD5
	8rqmNtD3F6VKgA7Wvn6gFVpdxQ==
X-Google-Smtp-Source: AK7set8Xz/aL92l0Ni3/aractyN6Wp417xTxkXhiQv0zhow98i9tK3SuFPlkcoJn1+vdNWphu4x93A==
X-Received: by 2002:a05:6214:400e:b0:56e:b33c:d990 with SMTP id kd14-20020a056214400e00b0056eb33cd990mr5120164qvb.24.1676308145096;
        Mon, 13 Feb 2023 09:09:05 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id f63-20020a37d242000000b0073917fae4f8sm6407427qkj.25.2023.02.13.09.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:09:04 -0800 (PST)
Date: Mon, 13 Feb 2023 12:09:02 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "peron.clem@gmail.com" <peron.clem@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] gator-daemon: bump to 8.3.0
Message-ID: <Y+purpuFMnQrBaDH@kudzu.us>
References: <20230207151952.94769-1-peron.clem@gmail.com>
 <485A1B59-6AC8-4439-AB6F-F9CCFA445706@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <485A1B59-6AC8-4439-AB6F-F9CCFA445706@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Feb 2023 17:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4388

On Wed, Feb 08, 2023 at 01:31:54PM +0000, Ross Burton wrote:
> On 7 Feb 2023, at 15:19, Cl�ment P�ron via lists.yoctoproject.org <peron.clem=gmail.com@lists.yoctoproject.org> wrote:
> > +DEPENDS = "boost libmxml protobuf protobuf-native"
> 
> This does mean that the CI needs work because libmxml is in meta-oe, not oe-core.
> 
> For example, https://gitlab.com/jonmason00/meta-arm/-/jobs/3735010875
> 
> Ross
> 

I tried adding ci/meta-openembedded.yml to ci/base.yml to see if that
would be sufficient to get this patch working, but I'm seeing another
issue:
   None of the required 'mxml>=3' found


Thanks,
Jon

