Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.5290.1586316905337365304
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=l3ydckXn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id 130so1823729qke.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 20:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S6U4unggLCFDsbmxIbogKmZyQL0ga83QZqIosCQpVtU=;
        b=l3ydckXn4+S8GYJeQKPR5uO8rF0fQvNrkYkW+/snnDGvf0FdvmYbFHUzm3QlW/tjrL
         LusQLoaJ9HszrH4gVr9RwCvrrZFGwwJF8f4BlFbj0MChJMSDCDa85prnoR8I1+SwzUDE
         nBDSV2d02+Jw+OzXelLnGN9DshSK06hP5zsQhOMuiPzKnGcaO32pNSLuI17wXh0/C74s
         ef4sqm76GqHaIWSsfGqBtArGbvqQrVI731WiSE0yt2qRENEul1xPgqlKVPntple60qfT
         4eukvuddwKQW4Am6mgd8mumtrRJcJVUoLoLmxtAbC15DJyX45BIjGDZg4qijVxL166sr
         7jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S6U4unggLCFDsbmxIbogKmZyQL0ga83QZqIosCQpVtU=;
        b=lLsVbS+H3p0sblnCRG6dOC102bN+76UCkPUrDsZti8FT9X04wfxyJwnC93QdKd+IYH
         B9+/Kj8wLyv70fYMNNaJpKRoZ/+FV2qtzGH+/NRJtiBEQAlLvW5f3QqAWRm//XsAuXZR
         s9AcLRxZ5FTBmeJ9k2KB6dJucEFM3WvgUpTmQCYIpHKiHrw1RwYvXSkc9JdZq8N3RtHP
         a95xtiskkOmsqHgDF5NujprJxtqbEloVH/w6tYUvfOGPE5NiRhwMa86UPCQAjpAQ9BOR
         MQGHyu4a29AkzIlCxUFg2gmLrsHps4NtpfNsvNiTIc78XyOWuhWdgdwFUts56O6HWUSE
         m1PQ==
X-Gm-Message-State: AGi0PuYakrn2YR/zlW/utf/a8gai4JaLFTfe1zuQhEgocPwBsivR7Xx9
	N+Bdm4Jm44/o7WsQKcQDERbqMAuDKZwDxQ==
X-Google-Smtp-Source: APiQypId8E2ophp9wVOb8Hm/bxxUAaeW+TfFEKkS7Iiup7RJa+lx7YNKuEmJW5sGk4xy164M68N4Wg==
X-Received: by 2002:a37:a3c1:: with SMTP id m184mr5790471qke.352.1586316904398;
        Tue, 07 Apr 2020 20:35:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id h128sm457933qkd.17.2020.04.07.20.35.04
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:35:04 -0700 (PDT)
Date: Tue, 7 Apr 2020 23:35:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 0/2] arm-autonomy: Add guest network bridge
Message-ID: <20200408033502.GB29748@kudzu.us>
References: <20200327105358.507-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200327105358.507-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2020 at 10:53:56AM +0000, Bertrand Marquis wrote:
> Create a system to have a network bridge on the host and connect some
> guests to it.
> Introduce a subdirectory support to ifupdown to allow to add bits to
> the network configuration using extra files.

Pull in to the master branch

Thanks,
Jon

> 
> Bertrand Marquis (2):
>   arm-autonomy: Add subdirectory config to ifupdown
>   arm-autonomy: Create xenguest network bridge
> 
>  meta-arm-autonomy/README.md                   |  5 ++
>  .../classes/xenguest-image.bbclass            | 11 ++++
>  .../documentation/xenguest-network-bridge.md  | 49 +++++++++++++++++
>  .../images/arm-autonomy-host-image-minimal.bb |  1 +
>  .../init-ifupdown/init-ifupdown_1.0.bbappend  | 18 +++++++
>  .../xenguest/files/network-bridge.sh.in       | 15 ++++++
>  .../files/xenguest-network-bridge-dhcp.cfg.in |  3 ++
>  .../xenguest/files/xenguest-network-bridge.in | 44 ++++++++++++++++
>  .../xenguest/xenguest-network-bridge.bb       | 52 +++++++++++++++++++
>  .../xenguest/xenguest-network-bridge.bbappend |  2 +
>  10 files changed, 200 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-network-bridge.md
>  create mode 100644 meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
>  create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
>  create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> 
> -- 
> 2.17.1
> 

> 

