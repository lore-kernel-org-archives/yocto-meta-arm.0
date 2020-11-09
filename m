Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.17896.1604954496959727153
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 12:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=tQLrnn1i;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id 63so4769369qva.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 12:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9W1hSI6eyYzxkVivqqoIkqKz4drd9c6BoZwnxzO7Ij4=;
        b=tQLrnn1ir6Dn1bnSOJlv1XHaBEnoOWgtGdjSAhwnzEkBKheWcjBQXxyzc/ZzFeWX7H
         t3T/is1+SMUWq/3nBAVDBDBPDXUD+Emb8VgyX981EGu7v0xgbWbaS56MtYfaTPTPeaKq
         JDnd78mnN/ZvjRmWbEE4z8PSAMU79Dkzh6GQLqMcpw35FbuUn5nAmZYV1HGFskCe3G8G
         wfaXDFXXH0SKrs8vqYfZlHeN9sQlSQxKUCQOLskgqdOTnrUu6thpZW/31xq3EUCXI4eZ
         qGWR7iEMVL6tT21QVYG+XV3KUK6/medZy99I/MD3rZytd8Rfs5zqlwUWxdhjElht9NCw
         wTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9W1hSI6eyYzxkVivqqoIkqKz4drd9c6BoZwnxzO7Ij4=;
        b=pcrKaZPr0d+JClu8pHqLf/s0ANtEw/ybZ8O70tZQqti04XSVKCB7sKUrW+Z6yVysKX
         xgsNNsKFUY2Mljx8PvRWCayB9S3Ut52w4nlahnls0N4ACqsbdo0oX+Vhr2/uWoCYRstv
         Q6RD5osedU4jFbutTR7OVBhCRq58vfLN0JmbMJs4BJhUB5lmJlonogN1oZcqHPFDotiQ
         FmC4ivi7ugmdMhHFhrWYoCJxtOoqFYXddHHO3m1jm5yo/B7KeebUZOIOgTsa398899dQ
         xvAMvybcaPZOoadOGaCVgxgW2IGfMtSBeeGTTCHXe6mGYd4Q37RVQQ19FlPSbIht86Ug
         ceeQ==
X-Gm-Message-State: AOAM533EQceBEHzECtd5uQK4wz1KojbyKGMW53Ab42so0c5nlLGKxhuV
	cgM3BGowJTii72phdzXMRqfqYftMDGuREw==
X-Google-Smtp-Source: ABdhPJxZ9l2LGv97wUHU6+JZfZ4G+aPFD/ID5Rm0zpRiKyWa8x2t/8JhB4h6VE9w6o0Obikr+n/qVA==
X-Received: by 2002:ad4:5221:: with SMTP id r1mr16298908qvq.59.1604954496128;
        Mon, 09 Nov 2020 12:41:36 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id l22sm5403062qke.118.2020.11.09.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:41:35 -0800 (PST)
Date: Mon, 9 Nov 2020 15:41:34 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-network: fix for unbound variable in network-bridge.sh
Message-ID: <20201109204133.GE17359@kudzu.us>
References: <20201109100849.11401-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201109100849.11401-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 11:08:49AM +0100, Kamil Dziezyk wrote:
> Undefined 'XENGUEST_NETWORK_TYPE' caused an error during guest start.
> 
> Change-Id: I5b0adea523f884cd4b649e3b85ae7e8860eb019a
> Issue-Id: SCM-1633
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Patch pushed to master.

Thanks,
Jon

> ---
>  .../recipes-extended/xenguest/files/network-bridge.sh.in        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> index 46d230e..967c245 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> @@ -8,7 +8,7 @@
>  
>  BRIDGE_NAME="###BRIDGE_NAME###"
>  
> -case "${XENGUEST_NETWORK_TYPE:-}" in
> +case "${XENGUEST_NETWORK_TYPE:=}" in
>      nat)
>          echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
>          ;;
> -- 
> 2.17.1
> 

> 
> 
> 

