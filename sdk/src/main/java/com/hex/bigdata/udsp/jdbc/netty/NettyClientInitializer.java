package com.hex.bigdata.udsp.jdbc.netty;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.json.JsonObjectDecoder;

import java.util.concurrent.CountDownLatch;

/**
 * Created by JunjieM on 2018-7-26.
 */
public class NettyClientInitializer extends ChannelInitializer<NioSocketChannel> {

    private NettyClientHandler handler;

    @Override
    protected void initChannel(NioSocketChannel ch) throws Exception {
        handler = new NettyClientHandler ();
        ch.pipeline () //
                .addLast (new JsonObjectDecoder (Integer.MAX_VALUE)) //
                .addLast (handler);
    }

    /**
     * 获取响应结果
     *
     * @return
     */
    public String getResult() {
        return handler.getResult ();
    }

    public CountDownLatch getLathc() {
        return handler.getLathc ();
    }

    /**
     * 重置同步锁
     *
     * @param lathc
     */
    public void setLathc(CountDownLatch lathc) {
        handler.setLathc (lathc);
    }

    public NettyClientHandler getHandler() {
        return handler;
    }

    public void setHandler(NettyClientHandler handler) {
        this.handler = handler;
    }
}
