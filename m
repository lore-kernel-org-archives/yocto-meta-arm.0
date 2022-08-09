Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA8DC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 15:26:48 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.13303.1660058803616982790
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=t9LJ9aeS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id w28so814844qtc.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Sn/KTNuqVUqfNvY3D2ZUs1D96wTnotreEt+3QMc4reI=;
        b=t9LJ9aeSnhZIe4IjncG0RsZ6bv8nN5RQrAZe7Dwcvtf0xTpWwBRPMxWE4JQWtomNfC
         cRXg94rc1N6n12a+dXVxEGGYTeT6+M2s+3qpyyxOnh6mG+AZJMVN+6q2vZ/ditAMhktx
         +sbv26WqCKavL0tXjrxVfhjvqj9sYUfZlwzG2rPbMOrDhc+8JIb7geG6hs5oPhaJEGPr
         JenbqNaFTUVtvU0iNasMYlR2jCY2Grv4LUyzGiMZdya3GRITA9hSpNFZ2F4t5pdtLFnS
         o02dHVomh0NgfWAHN5MOYpw5/dsj7tJRzlQoJN2prZtJgR2m1HsoiIa8Toj4m1ZKjl1k
         kIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Sn/KTNuqVUqfNvY3D2ZUs1D96wTnotreEt+3QMc4reI=;
        b=cIIniZvuV88g/EK6iwxQ9eCGGjNg/MgZr5Og9ZLyO4ShGBugYdZ4sOHts8p4tuKS6E
         FWhxA/9xx6bXbJvLpUmDRyMR3Jzu8FOaGHX3spGzR6nVxmpVQYVOqufdXn7Mu5q6Nm6W
         c9JMK1aNLG3lULa3XyAGaIBmnjI/EqqbaMj/YaFDoqI2vKKHhJzCAsX/M30owHaufS4Q
         32pVxecQFlBfAHTUIFiV9l+LQzc7FHbrqPILIlbOkV/TwjCPZUFGrPP+fvgRyQWZMCi7
         xEngPMy7E09VEG/l/E/KNg1BFrSO0qYMvkUr5O9ARSVRg4xTQ22YmzcGneY09PeMQhnp
         Z1mg==
X-Gm-Message-State: ACgBeo2bV4en3hmz9GZZacI13E7m567JG6BW2Wy3mTfjrn1O4U6zynfF
	qEqDwsnd1EbTJbMzsZcGkkPgjA==
X-Google-Smtp-Source: 
 AA6agR79Z9o+NhsVXAqlNBwJoksfmQ8nTSZXt2HPUQSUpQP9mTAmIqaGhNJI4PKthbrzpqjhtlDVhA==
X-Received: by 2002:a05:622a:89:b0:31f:22e3:612a with SMTP id
 o9-20020a05622a008900b0031f22e3612amr20256485qtw.32.1660058802689;
        Tue, 09 Aug 2022 08:26:42 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w16-20020ac87190000000b00342f652cdc1sm5161741qto.67.2022.08.09.08.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 08:26:41 -0700 (PDT)
Date: Tue, 9 Aug 2022 11:26:39 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Diego.Sueiro@arm.com
Subject: Re: [PATCH 1/2] docs: Update FVP_CONSOLES in runfvp documentation
Message-ID: <YvJ8r7J8Op6BBk1c@kudzu.us>
References: <20220805144756.2492832-1-peter.hoyes@arm.com>
 <165998718800.2694832.618076795430673700.b4-ty@arm.com>
 <ca54c29a-6e52-083d-b965-d55598cd513e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca54c29a-6e52-083d-b965-d55598cd513e@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Aug 2022 15:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3667

On Tue, Aug 09, 2022 at 09:44:20AM +0100, Peter Hoyes wrote:
> On 08/08/2022 20:33, Jon Mason wrote:
> > On Fri, 5 Aug 2022 15:47:55 +0100, Peter Hoyes wrote:
> > > The runfvp refactor to enable OEFVPSerialTarget created FVP_CONSOLES
> > > which maps the names used for serial ports in test cases to the names
> > > used for serial ports in the FVP stdout.
> > > 
> > > Refactor the FVP_CONSOLE section -> FVP_CONSOLES, noting the the
> > > 'default' console is still used for the --console runfvp flag.
> > Applied, thanks!
> > 
> > [1/2] docs: Update FVP_CONSOLES in runfvp documentation
> >        commit: 74a36b024f4d20c80e7c686cdc6d829d60a2689d
> > [2/2] docs: Introduce meta-arm OEQA documentation
> >        commit: f83aad2ba9d43327bcae28b6c05a8a8ab9d5a519
> > 
> > Best regards,
> Please can this chain be backported to kirkstone.
> 
Done

